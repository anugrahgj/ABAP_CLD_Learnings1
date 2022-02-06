CLASS zcl_ve_status_crtclt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ve_status_crtclt IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_status TYPE STANDARD TABLE OF ZC_ZKAST_RAP_Travel_1 WITH DEFAULT KEY.
    lt_status = CORRESPONDING #( it_original_data ).


    LOOP AT lt_status ASSIGNING FIELD-SYMBOL(<fs_status>).

      IF <fs_status>-TravelStatus = 'O'.
        <fs_status>-StatusCriticality = 2.
      ELSEIF  <fs_status>-TravelStatus = 'A'.
        <fs_status>-StatusCriticality = 3.
      ELSEIF  <fs_status>-TravelStatus = 'X'.
        <fs_status>-StatusCriticality = 1.
      ENDIF.

*      <customer>-CustImageURL = 'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #(  lt_status ).


  ENDMETHOD.





  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.

ENDCLASS.
