@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Contractor Attendance'
define view entity ZI_TM_ATTENDANCE as select from zit_attendance as _attendance
association to parent ZI_HD_CONTRACTOR as _contractor
    on $projection.ContractorKey = _contractor.ContractorKey 
{
    key attendance_key as AttendanceKey,
    contractor_key as ContractorKey,
    entry_date as EntryDate,
    time_in as TimeIn,
    time_out as TimeOut,
    _contractor // Make association public
}
