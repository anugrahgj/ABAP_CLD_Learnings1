FUNCTION Z_CREATE_ITEM_WITH_DATA_07.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(ITEM) TYPE  Z_SALES_ITEM_TT_M_07
*"  EXPORTING
*"     VALUE(STATUS) TYPE  I
*"----------------------------------------------------------------------
    If ITEM is not INITIAL.

        INSERT ZVBAP_07 FROM TABLE @ITEM.
        if sy-subrc <> 0.

            "Error
            STATUS = 1.

        ELSE.

            STATUS = 0.

        ENDIF.


    ENDIF.






ENDFUNCTION.
