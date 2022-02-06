CLASS zemp_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zemp_fill IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA: it_employee TYPE TABLE OF zemp_um.

    it_employee = VALUE #(
                           ( employee_id = '0001' employee_name = 'John' employee_gender  = 'M' employee_dob = '19960705')
                           ( employee_id = '0002' employee_name = 'Gisa' employee_gender  = 'F' employee_dob = '20000705')
     ).

DELETE FROM zemp_um.

INSERT zemp_um FROM TABLE @it_employee.

SELECT * FROM zemp_um INTO TABLE @it_employee.
out->write(  sy-dbcnt ).
out->write( 'data inserted successfully!' ).



ENDMETHOD.

ENDCLASS.
