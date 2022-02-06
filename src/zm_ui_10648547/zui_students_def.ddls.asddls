@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Student General Data Def.'
define root view entity zui_students_def
  as select from zui_students as students
  association [0..*] to zui_lessons      as _lessons on $projection.lesson_num = _lessons.lesson_num
  association [0..*] to zui_student_name as _sname   on $projection.student_num = _sname.student_num
{
  key  student_num,
  key  lesson_num,
       _lessons.lesson_name,
       lesson_point,
       lesson_score,
       _lessons.effect,
       @Semantics.name.givenName
       _sname.student_name,
       @Semantics.name.familyName
       _sname.student_surname
}
