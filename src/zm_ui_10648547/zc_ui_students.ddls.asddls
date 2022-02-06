@EndUserText.label: 'Students  Projection View'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_UI_STUDENTS
  as projection on zui_students_def as Student
{
  key student_num,
  key lesson_num,
      lesson_name,
      lesson_point,
      @Search.defaultSearchElement: true
      lesson_score,
      effect,
      student_name,
      student_surname
}
