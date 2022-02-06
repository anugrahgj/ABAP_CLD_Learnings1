CLASS zcl_rap_unsert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS insert_ux_team_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_unsert_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    insert_ux_team_data( ).
  ENDMETHOD.

  METHOD insert_ux_team_data.
    DATA lt_ZRAP_UX_TEAM TYPE STANDARD TABLE OF zrap_ux_team.

    lt_ZRAP_UX_TEAM = VALUE #(
    ( firstname = 'Tom'
      lastname = 'Jons'
      age = 30
      role = 'Developer'
      salary = 1000 )

*    ( firstname = 'Sam'
*      lastname = 'Maxvel'
*      age = 45
*      role = 'Lead'
*      salary = 2500 )
).

    INSERT zrap_ux_team FROM TABLE @lt_ZRAP_UX_TEAM.

  ENDMETHOD.

ENDCLASS.
