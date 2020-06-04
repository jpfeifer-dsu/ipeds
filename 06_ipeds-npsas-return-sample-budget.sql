/****************************************************************************
NOTES:
Update Parameter :main_EB_AidYear to current FA aidy code (i.e. '1920')
Update join on sample student table (i.e ipeds_npsas_sample_data_2020@dscir)
Execute Query
Export as CSV file with no headers
 ***************************************************************************/

-- ipeds_npsas_submit_BUDG
select distinct
       1 as file_spec_ver_num,
       '230171' as institute_id,
       study_id,
       spriden.spriden_id as student_id,
--        spriden.spriden_last_name as last_name,
--        spriden.spriden_first_name as first_name,
       decode(rorstat_aprd_code, 'SPRING', '2', 'SUMMER', '2', '1') "Budget_Period",
       0 as "Full_Year_Budget",  -- does not include summer term
       decode(rcrapp1.rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1') "Student_Residence",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'
              and rbrapbc_pbcp_code in ('TUIT', 'FEES')), 0) "Tuition",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'
              and rbrapbc_pbcp_code = 'B+S'), 0) "Books_Supplies",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'
              and rbrapbc_pbcp_code = 'R+B'), 0) "Room_Board",
       0 "Insurance",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'
              and rbrapbc_pbcp_code = 'TRAN'), 0) "Transportation",

       0 "Computer",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'
              and rbrapbc_pbcp_code not in ('TUIT', 'FEES', 'TRAN', 'B+S', 'R+B')), 0) "Others",
       nvl((select sum(rbrapbc_amt)
            from faismgr.rbrapbc
            where rbrapbc_pidm = spriden_pidm
              and rbrapbc_aidy_code = :main_EB_AidYear
              and rbrapbc_pbtp_code = 'CAMP'), 0) "Total_Budget"
from saturn.spriden spriden,
     faismgr.rorstat rorstat,
     faismgr.rcrapp1 rcrapp1,
     ipeds_npsas_sample_data_2020@dscir
where (spriden.spriden_pidm = rorstat.rorstat_pidm (+) and rorstat.rorstat_pidm = rcrapp1.rcrapp1_pidm (+) and
       rorstat.rorstat_aidy_code = rcrapp1.rcrapp1_aidy_code (+) and '00' || student_id = spriden_id)
  and (spriden.spriden_change_ind is null and rorstat.rorstat_aidy_code = :main_EB_AidYear and
       (rcrapp1.rcrapp1_curr_rec_ind = 'Y' or rcrapp1.rcrapp1_curr_rec_ind is null));