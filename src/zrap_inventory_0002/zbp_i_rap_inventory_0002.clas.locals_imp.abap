CLASS LHC_INVENTORY DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      CALCULATEINVENTORYID FOR DETERMINE ON SAVE
        IMPORTING
          KEYS FOR  Inventory~CalculateInventoryID .
ENDCLASS.

CLASS LHC_INVENTORY IMPLEMENTATION.
  METHOD CALCULATEINVENTORYID.

  "Ensure idempotence
    READ ENTITIES OF ZI_RAP_INVENTORY_0002 IN LOCAL MODE
      ENTITY Inventory
        FIELDS ( InventoryID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(inventories).

    DELETE inventories WHERE InventoryID IS NOT INITIAL.
    CHECK inventories IS NOT INITIAL.

    "Get max travelID
    SELECT SINGLE FROM ZRAP_INVEN_0002 FIELDS MAX( inventory_id ) INTO @DATA(max_inventory).

    "update involved instances
    MODIFY ENTITIES OF ZI_RAP_INVENTORY_0002  IN LOCAL MODE
      ENTITY Inventory
        UPDATE FIELDS ( InventoryID )
        WITH VALUE #( FOR inventory IN inventories INDEX INTO i (
                           %tky      = inventory-%tky
                           inventoryID  = max_inventory + i ) )
    REPORTED DATA(lt_reported).

    "fill reported
    reported = CORRESPONDING #( DEEP lt_reported ).
  ENDMETHOD.
ENDCLASS.
