CLASS lhc_Subfamily DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR Subfamily RESULT result.

  ENDCLASS.

CLASS lhc_Subfamily IMPLEMENTATION.

  METHOD get_global_features.
    result = VALUE #(

*    " Action control information
*               %features-%action-action_name = if_abap_behv=>fc-o-enabled
*    " Operation (example: update) control information
*               %features-%update             = if_abap_behv=>fc-o-enabled
    " Operation control information for create by association
               %assoc-_Text                 = if_abap_behv=>fc-o-enabled
              ).

  ENDMETHOD.

ENDCLASS.
