*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_family DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS: get_global_features FOR GLOBAL FEATURES
                                 IMPORTING REQUEST requested_features FOR Family RESULT result,
             get_field_features FOR FEATURES IMPORTING keys REQUEST requested_features FOR FamilyText RESULT result.

ENDCLASS.

CLASS lhc_family IMPLEMENTATION.

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

  METHOD get_field_features.

    READ ENTITIES OF ZPYX_I_FAMILY IN LOCAL MODE
      ENTITY FamilyText
        FIELDS ( Langu )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_texts)
      FAILED failed.

    result = VALUE #( for <ls_text> in lt_texts (  %tky                  = <ls_text>-%tky
                                                   %field-Langu = if_abap_behv=>fc-f-unrestricted ) ).

  ENDMETHOD.

ENDCLASS.
