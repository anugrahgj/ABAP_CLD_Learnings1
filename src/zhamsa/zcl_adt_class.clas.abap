CLASS zcl_adt_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_adt_class IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
data: gt_sales type STANDARD TABLE OF zhsalesorders,
      gt_delivery type STANDARD TABLE OF zhlikp,
      gt_lips type STANDARD TABLE OF zhlips.
      gt_sales = VALUE #( ( vbeln = '1234' werks = 'SEF1' gross_amount = '50' curr_code = 'US' ) ) .

     DELETE FROM zhsalesorders.
     INSERT zhsalesorders FROM TABLE @gt_sales.
     OUT->write( ' Success').

     gt_delivery = VALUE #( ( vbeln = '180001179' ernam = 'DEHHAKK' erzet = '08:19:41' erdat = '28.04.2020'
                              vstel = '1901' vkorg = '1010' btgew = '88.90' ntgew = '55.7' gewei = 'KG') ).

DELETE FROM zhlikp.
     INSERT zhlikp FROM TABLE @gt_delivery.
     OUT->write( ' Success').

gt_lips = VALUE #( ( vbeln = '180001179' posnr = '0010' pstyv = 'ELN' matnr = 'LPRM01' matkl = 'text' netpr = '500' currency_code = 'INR' ) ).

DELETE FROM zhlips.
     INSERT zhlips FROM TABLE @gt_lips.
     OUT->write( ' Success').

ENDMETHOD.

ENDCLASS.
