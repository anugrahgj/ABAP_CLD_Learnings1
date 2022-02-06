@EndUserText.label: 'CDS view for student table'
@AccessControl.authorizationCheck: #CHECK
define root view entity zcds_stud as select from zstudent {
    key student_num as StudentNum,
    student_name as StudentName,
    student_surname as StudentSurname
}
    
