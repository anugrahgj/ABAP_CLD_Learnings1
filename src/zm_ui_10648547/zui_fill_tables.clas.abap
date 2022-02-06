CLASS zui_fill_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUI_FILL_TABLES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  Clear Database Tables
    DELETE FROM zui_students.
    DELETE FROM zui_lessons.
    DELETE FROM zui_student_name.

    "Table and Structure Def.
    DATA: ls_students TYPE zui_students,
          lt_students TYPE TABLE OF zui_students,
          ls_lessons  TYPE zui_lessons,
          lt_lessons  TYPE TABLE OF zui_lessons,
          ls_names    TYPE zui_student_name,
          lt_names    TYPE TABLE OF zui_student_name.
    "Append internal table for Lessons
    ls_lessons-lesson_num = 100.
    ls_lessons-lesson_name = 'Calculus'.
    ls_lessons-effect = '4'.
    ls_lessons-fields = 'MATHS'.
    APPEND ls_lessons TO lt_lessons.
    CLEAR ls_lessons.

    ls_lessons-lesson_num = 101.
    ls_lessons-lesson_name = 'Algorithm'.
    ls_lessons-effect = '5'.
    ls_lessons-fields = 'CS'.
    APPEND ls_lessons TO lt_lessons.
    CLEAR ls_lessons.

    ls_lessons-lesson_num = 102.
    ls_lessons-lesson_name = 'Electronics'.
    ls_lessons-effect = '3'.
    ls_lessons-fields = 'Physics'.
    APPEND ls_lessons TO lt_lessons.
    CLEAR ls_lessons.
    "fill dbtable
    INSERT zui_lessons FROM TABLE @lt_lessons   .
    COMMIT WORK AND WAIT.

    "Append internal table for Students
    ls_students-student_num = 200.
    ls_students-lesson_num = 100.
    ls_students-lesson_point = 80.
    ls_students-lesson_score = 'A'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    ls_students-student_num = 200.
    ls_students-lesson_num = 101.
    ls_students-lesson_point = 60.
    ls_students-lesson_score = 'C'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    ls_students-student_num = 200.
    ls_students-lesson_num = 102.
    ls_students-lesson_point = 40.
    ls_students-lesson_score = 'D'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.

    ls_students-student_num = 201.
    ls_students-lesson_num = 100.
    ls_students-lesson_point = 60.
    ls_students-lesson_score = 'C'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    ls_students-student_num = 201.
    ls_students-lesson_num = 101.
    ls_students-lesson_point = 70.
    ls_students-lesson_score = 'B'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    ls_students-student_num = 201.
    ls_students-lesson_num = 102.
    ls_students-lesson_point = 90.
    ls_students-lesson_score = 'A'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.

    ls_students-student_num = 202.
    ls_students-lesson_num = 100.
    ls_students-lesson_point = 30.
    ls_students-lesson_score = 'F'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.

    ls_students-student_num = 202.
    ls_students-lesson_num = 101.
    ls_students-lesson_point = 60.
    ls_students-lesson_score = 'C'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    ls_students-student_num = 202.
    ls_students-lesson_num = 102.
    ls_students-lesson_point = 80.
    ls_students-lesson_score = 'A'.
    APPEND ls_students TO lt_students.
    CLEAR ls_students.
    "fill dbtable
    INSERT zui_students FROM TABLE @lt_students   .
    COMMIT WORK AND WAIT.
    ""Append internal table for Student Names

    ls_names-student_num = 200.
    ls_names-student_name = 'John'.
    ls_names-student_surname = 'Lennon'.
    APPEND ls_names TO lt_names.
    CLEAR ls_names.
    ls_names-student_num = 201.
    ls_names-student_name = 'Freddie'.
    ls_names-student_surname = 'Mercury'.
    APPEND ls_names TO lt_names.
    CLEAR ls_names.
    ls_names-student_num = 202.
    ls_names-student_name = 'David'.
    ls_names-student_surname = 'Bowie'.
    APPEND ls_names TO lt_names.
    CLEAR ls_names.
    "fill dbtable
    INSERT zui_student_name FROM TABLE @lt_names.
    COMMIT WORK AND WAIT.
    out->write( 'All Datas are inserted' ).
  ENDMETHOD.
ENDCLASS.
