class ZCL_IP_HTTP_064 definition
  public
  create public .

public section.

  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IP_HTTP_064 IMPLEMENTATION.

  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.
    DATA(system_date) = cl_abap_context_info=>get_system_date( ).
    DATA: text type string.

          text = system_date.
          "response->set_text( text ).
          response->set_text( | { system_date DATE = USER } | ).
  endmethod.

ENDCLASS.
