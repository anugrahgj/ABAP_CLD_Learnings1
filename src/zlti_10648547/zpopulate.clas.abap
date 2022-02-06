CLASS zpopulate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zpopulate IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

data : ls_student type zstudent,
       lt_student type table of zstudent.

       ls_student-student_name = 'Mandar'.
       ls_student-student_num = '1'.
       ls_student-student_surname = 'Gijre'.
       append ls_student to lt_student.

       ls_student-student_name = 'Milind'.
       ls_student-student_num = '2'.
       ls_student-student_surname = 'G'.
              append ls_student to lt_student.

              ls_student-student_name = 'Mayank'.
       ls_student-student_num = '3'.
       ls_student-student_surname = 'Gijre'.
              append ls_student to lt_student.

              INSERT zstudent FROM TABLE @lt_student.

  ENDMETHOD.

ENDCLASS.
