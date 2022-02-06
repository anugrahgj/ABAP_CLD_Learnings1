CLASS zcl_ve_cust_initial DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ve_cust_initial IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA customers TYPE STANDARD TABLE OF ZC_ZKAST_RAP_Travel_1 WITH DEFAULT KEY.
    customers = CORRESPONDING #( it_original_data ).

    LOOP AT customers ASSIGNING FIELD-SYMBOL(<customer>).

      IF <customer>-TravelStatus = 'O'.
        <customer>-CustImageURL = 'OPEN'.
      ELSEIF <customer>-TravelStatus = 'A'.
        <customer>-CustImageURL = 'Accepted'.
      ELSEIF <customer>-TravelStatus = 'X'.
        <customer>-CustImageURL = 'Canceled'.
      ENDIF.

*      <customer>-CustImageURL = 'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #(  customers ).




    DATA customers1 TYPE STANDARD TABLE OF ZC_ZKAST_RAP_Booking WITH DEFAULT KEY.
    customers1 = CORRESPONDING #( it_original_data ).

    LOOP AT customers1 ASSIGNING FIELD-SYMBOL(<customer1>).
      <customer1>-CustImageURL1 = 'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'.

    <customer1>-dummy1 = 5.

    <customer1>-dummy2 = 50.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #(  customers1 ).

*
*    <customer1>-dummy1 = 5.
*
*    <customer1>-dummy2 = 50.


*
*    DATA lt_BookingFee TYPE STANDARD TABLE OF ZC_ZKAST_RAP_Travel_1 WITH DEFAULT KEY.
*    lt_BookingFee = CORRESPONDING #( it_original_data ).
*
*    LOOP AT lt_BookingFee ASSIGNING FIELD-SYMBOL(<fs_BookingFee>).
*      <fs_BookingFee>-Criticality = 1.
*    ENDLOOP.
*
*    ct_calculated_data = CORRESPONDING #(  lt_BookingFee ).





  ENDMETHOD.



  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.

ENDCLASS.
