CLASS zcl_kast_http_service DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .

  PROTECTED SECTION.
  PRIVATE SECTION.

*    METHODS: get_html
*      RETURNING VALUE(html) TYPE string.
*
*    METHODS: post_html
*      IMPORTING
*                First_Name  TYPE string
*                Last_Name   TYPE string
*                Company     TYPE string
*      RETURNING VALUE(html) TYPE string.
*
*    CLASS-DATA url TYPE string.

ENDCLASS.


CLASS zcl_kast_http_service IMPLEMENTATION.

  METHOD if_http_service_extension~handle_request.


    DATA(lt_para) = request->get_form_fields( ).

    READ TABLE lt_para REFERENCE INTO DATA(lr_para) WITH KEY name = 'input'.

    IF sy-subrc = 0.

      CASE lr_para->value.

        WHEN 'send'.
          response->set_text( |Hello, Welcome to Cloud Project| ).

        WHEN 'more'.
          response->set_text( |Visit abaper.weebly.com| ).

        WHEN 'system'.

          response->set_text( | Executed by {
                               cl_abap_context_info=>get_user_technical_name( ) } | &&
                               |{ cl_abap_context_info=>get_system_date( ) DATE = ENVIRONMENT }| ).


        WHEN 'consume'.
          response->set_text( NEW zcl_kast_http_service_glaccoun( )->get_api( )  )  .

        WHEN OTHERS.
          response->set_status( i_code = 400 i_reason = 'Wrong Value Passed').

      ENDCASE.
    ELSE.
      response->set_status( i_code = 400 i_reason = 'Invalid Parameter Passed').
    ENDIF.



*    url = 'https://8cd42072-dcdc-4485-ac0b-7fcac3f63ef4.abap-web.eu10.hana.ondemand.com:443/sap/bc/http/sap/zkast_http_service/?sap-client=100'.
*
*    CASE request->get_method( ).
*
*      WHEN CONV string( if_web_http_client=>get ).
*
*        response->set_text( get_html( ) ).
*
*      WHEN CONV string( if_web_http_client=>post ).
*
*        DATA(First_Name) = request->get_form_field(  'first_name' ).
*        DATA(Last_Name)  = request->get_form_field(  'last_name'  ).
*        DATA(Company)    = request->get_form_field(  'company'    ).
*
*        response->set_text( post_html(
*                                      EXPORTING First_Name  = First_Name
*                                                Last_Name   = Last_Name
*                                                Company     = Company
*                                        ) ).
*    ENDCASE.
*
*
*
*
*
*
*
*  ENDMETHOD.
*
*
*  METHOD get_html.
*
*    html = |<html> \n| &&
*  |<body> \n| &&
*
*  |<title> Registration Form </title> \n| &&
*
*  |<form action="{ url }" method="POST">\n| &&
*
*  |<H2>Blogger Registration</H2> \n| &&
*
*  |<label for="first_name">First name:  </label> \n| &&
*  |<input type="text" id="first_name" name="first_name" required ><br><br> \n| &&
*
*  |<label for="last_name">Last name:</label> | &&
*  |<input type="text" id="last_name" name="last_name" required ><br><br> \n | &&
*
*  |<label for="company">Company:</label> | &&
*  |<input type="text" id="company" name="company" required ><br><br> \n | &&
*
*  |<input type="submit" value="Submit"> \n| &&
*
*  |</form> | &&
*
*  |</body> \n| &&
*  |</html> | .
*
*  ENDMETHOD.
*
*
*  METHOD post_html.
*
*    html = |<html> \n| &&
*
*   |<body> \n| &&
*
*   |<title>Registration Form </title> \n| &&
*
*   |<form action="{ url }" method="Get">\n| &&
*
*   |<H2>Blogger Registration Success </H2> \n| &&
*
*   |<p> Thanks { First_Name  } { Last_Name } working for { Company }  </p> | &&
*
*   |<p> for Registering with knowledge sharing BLOGS Platform. </p> | &&
*
*   |<input type="submit" value="Go Back"> \n| &&
*
*   |</form> | &&
*
*   |</body> \n| &&
*   |</html> | .


  ENDMETHOD.

ENDCLASS.







