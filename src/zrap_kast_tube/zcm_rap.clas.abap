CLASS zcm_rap DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF age_incorrect,
        msgid TYPE symsgid VALUE 'ZRAP_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'AGE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF age_incorrect .

    CONSTANTS:
      BEGIN OF email_incorrect,
        msgid TYPE symsgid VALUE 'ZRAP_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'EMAILADDRESS',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF email_incorrect .


    METHODS constructor
      IMPORTING
        severity     TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid       LIKE if_t100_message=>t100key OPTIONAL
        previous     TYPE REF TO cx_root OPTIONAL
        age          TYPE zkast_age OPTIONAL
        emailaddress TYPE /dmo/email_address OPTIONAL.

    DATA: age          TYPE string READ-ONLY,
          emailaddress TYPE /dmo/email_address READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_rap IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->age = |{ age ALPHA = OUT }|.
    me->emailaddress = emailaddress.

  ENDMETHOD.

ENDCLASS.
