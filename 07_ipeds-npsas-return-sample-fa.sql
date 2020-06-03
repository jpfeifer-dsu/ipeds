/****************************************************************************
Update :main_EB_AidYear to current FA aidy code (i.e. '1920')
Update join on sample student table (i.e ipeds_npsas_sample_data_2020@dscir)
Execute Query
Export as CSV file with no headers
 ***************************************************************************/
-- ipeds_npsas_submit_FA
select distinct
        1 as file_spec_ver_num,
       '230171' as institute_id,
       study_id,
       -- spriden.spriden_pidm,
       spriden.spriden_id student_id,
--        spriden.spriden_last_name as last_name,
--        spriden.spriden_first_name as first_name,
       '' as financial_aid_warning,
       '' as financial_aid_probation,
       '' as financial_aid_ineligibility,
       nvl((select distinct '1'
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rpratrm_fund_code = rfrbase_fund_code
              and rpratrm_orig_offer_amt > 0
              and rfrbase_fsrc_code = 'FDRL'), '0') as federal_elegibility,
       (select SUM(distinct rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_fund_code = 'FPELL'
          and spriden_pidm in (select rpratrm_pidm
                               from faismgr.rpratrm
                               where rpratrm_period in ('201930', '201940', '202020')
                                 and rpratrm_fund_code = 'FPELL')) as pell_grant,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code = 'DIRECT') as subsidized_direct,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code = 'DUSUB') as unsubsidized,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code = 'DPLUS') as parent_plus,
       '' as fed_teach,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code = 'FPERK') as perkins,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code in ('FSEOG', 'FSEOGS')) as fed_seog,
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm
        where rpratrm_pidm = spriden_pidm
          and rpratrm_aidy_code = :main_EB_AidYear
          and rpratrm_fund_code in ('FCWS', 'FCWSA')) as fed_work_study,
       '' as service_grant,
       (select distinct sgrvetn_vetc_code from sgrvetn where sgrvetn_pidm = spriden_pidm) as veteran,
       nvl((select distinct '1'
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code = 'STAT'), '0') as state_aid,
       nvl((select listagg(rfrbase_fund_title, ',') within group (order by rfrbase_fund_title)
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code = 'STAT'), '') "State_Name",

      (select decode(rfrbase_ftyp_code, 'NEED', '1', 'GENL', '5', 'SCHL', '2', 'WORK', '7', rfrbase_ftyp_code)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code = 'STAT') "State_Programs_TEST",

       (select listagg(decode(rfrbase_ftyp_code, 'NEED', '1', 'GENL', '5', 'SCHL', '2', 'WORK', '7', rfrbase_ftyp_code),
                       ',') within group (order by rfrbase_ftyp_code)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code = 'STAT') "State_Programs",
       nvl((select SUM(rpratrm_orig_offer_amt)
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code = 'STAT'), '0') "State_Amount",
       nvl((select distinct '1'
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code in ('INST', 'PRES')), '0') "Institution_Aid",
       nvl((select listagg(rfrbase_fund_title, ',') within group (order by rfrbase_fund_title)
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code in ('INST', 'PRES')), '') "Institution_Name",
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code in ('INST', 'PRES')) "Institution_Amount",
       '' "Graduate_Aid",
       (select listagg(decode(rfrbase_ftyp_code, 'GENL', '9', 'SCHL', '9'), ',')
                       within group (order by rfrbase_ftyp_code)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code in ('INST', 'PRES')) "Institution_Programs",
       '' "Graduate_Name",
       '' "Graduate_Programs",
       '' "Graduate_Amount",
       nvl((select distinct '1'
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code = 'PRIV'), '0') "Private_Aid",
       nvl((select listagg(rfrbase_fund_title, ',') within group (order by rfrbase_fund_title)
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code = 'PRIV'), '') "Private_Name",
       (select listagg(decode(rfrbase_ftyp_code, 'GENL', '9', 'SCHL', '9'), ',')
                       within group (order by rfrbase_ftyp_code)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code = 'PRIV') "Private_Programs",
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code = 'PRIV') "Private_Amount",
       nvl((select distinct '1'
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')), '0') "Other_Aid",
       nvl((select listagg(rfrbase_fund_title, ',') within group (order by rfrbase_fund_title)
            from faismgr.rpratrm,
                 faismgr.rfrbase
            where rpratrm_pidm = spriden_pidm
              and rfrbase_fund_code = rpratrm_fund_code
              and rpratrm_aidy_code = :main_EB_AidYear
              and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')), '') "Other_Name",
       (select listagg(decode(rfrbase_ftyp_code, 'GENL', '9', 'SCHL', '9'), ',')
                       within group (order by rfrbase_ftyp_code)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')) "Other_Programs",
       (select SUM(rpratrm_orig_offer_amt)
        from faismgr.rpratrm,
             faismgr.rfrbase
        where rpratrm_pidm = spriden_pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_aidy_code = :main_EB_AidYear
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')) "Other_Amount"
from saturn.spriden spriden,
     ipeds_npsas_sample_data_2020@dscir
where '00' || student_id = spriden_id AND spriden_change_ind is null
order by 3,4;

/*
-- IPEDS-NPSAS Financial Aid
with student_list as (select pidm,
                             banner_id,
                             study_id,
                             dsc_term_code,
                             first_name,
                             middle_name,
                             last_name,
                             null as budget_full_year,
                             1 as registered,
                             budget_period,
                             student_residence,
                             tuition_and_fees,
                             books_and_supplies,
                             room_and_board,
                             0 as health_insurance,
                             transportation,
                             computer_and_tech,
                             0 as all_other,
                             tuition_and_fees + books_and_supplies + room_and_board + transportation +
                             computer_and_tech as budget_total,
                             financial_aid_warning,
                             financial_aid_probation,
                             financial_aid_ineligibility,
                             federal_elegibility,
                             pell_grant,
                             direct,
                             unsubsidized,
                             plus,
                             '' as teach,
                             perkins,
                             seog,
                             work_study,
                             '' as service_grant,
                             veteran,
                             -- State Aid
                             case when state_count > 0 then 1 else 0 end as state_aid,
                             case
                                 when state_count = 1 then state_programs
                                 when state_count >= 2
                                     then substr(state_programs, 1, instr(state_programs, '`', 1, 1) - 1)
                             end as state_program_1,
                             case
                                 when state_count = 2 then substr(state_programs, instr(state_programs, '`', 1, 1) + 1,
                                                                  length(state_programs) - 1)
                                 when state_count >= 3 then substr(state_programs, instr(state_programs, '`', 1, 1) + 1,
                                                                   instr(state_programs, '`', 1, 2) -
                                                                   instr(state_programs, '`', 1, 1) - 1)
                             end as state_program_2,
                             case
                                 when state_count >= 3 then substr(state_programs, instr(state_programs, '`', 1, 2) + 1,
                                                                   length(state_programs))
                             end as state_program_3,
                             -- Institution Aid
                             case when institution_count > 0 then 1 else 0 end as institution_aid,
                             case
                                 when institution_count = 1 then institution_programs
                                 when institution_count >= 2 then substr(institution_programs, 1,
                                                                         instr(institution_programs, '`', 1, 1) - 1)
                             end as institution_program_1,
                             case
                                 when institution_count = 2 then substr(institution_programs,
                                                                        instr(institution_programs, '`', 1, 1) + 1,
                                                                        length(institution_programs) - 1)
                                 when institution_count >= 3 then substr(institution_programs,
                                                                         instr(institution_programs, '`', 1, 1) + 1,
                                                                         instr(institution_programs, '`', 1, 2) -
                                                                         instr(institution_programs, '`', 1, 1) - 1)
                             end as institution_program_2,
                             case
                                 when institution_count >= 3 then substr(institution_programs,
                                                                         instr(institution_programs, '`', 1, 2) + 1,
                                                                         length(institution_programs))
                             end as institution_program_3,
                             -- Private Aid
                             case when private_count > 0 then 1 else 0 end as private_aid,
                             case
                                 when private_count = 1 then private_programs
                                 when private_count >= 2
                                     then substr(private_programs, 1, instr(private_programs, '`', 1, 1) - 1)
                             end as private_program_1,
                             case
                                 when private_count = 2 then substr(private_programs,
                                                                    instr(private_programs, '`', 1, 1) + 1,
                                                                    length(private_programs) - 1)
                                 when private_count >= 3 then substr(private_programs,
                                                                     instr(private_programs, '`', 1, 1) + 1,
                                                                     instr(private_programs, '`', 1, 2) -
                                                                     instr(private_programs, '`', 1, 1) - 1)
                             end as private_program_2,
                             case
                                 when private_count >= 3 then substr(private_programs,
                                                                     instr(private_programs, '`', 1, 2) + 1,
                                                                     length(private_programs))
                             end as private_program_3,
                             -- Other aid
                             case when other_count > 0 then 1 else 0 end as other_aid,
                             case
                                 when other_count = 1 then other_programs
                                 when other_count >= 2
                                     then substr(other_programs, 1, instr(other_programs, '`', 1, 1) - 1)
                             end as other_program_1,
                             case
                                 when other_count = 2 then substr(other_programs, instr(other_programs, '`', 1, 1) + 1,
                                                                  length(other_programs) - 1)
                                 when other_count >= 3 then substr(other_programs, instr(other_programs, '`', 1, 1) + 1,
                                                                   instr(other_programs, '`', 1, 2) -
                                                                   instr(other_programs, '`', 1, 1) - 1)
                             end as other_program_2,
                             case
                                 when other_count >= 3 then substr(other_programs, instr(other_programs, '`', 1, 2) + 1,
                                                                   length(other_programs))
                             end as other_program_3,
                             rn
                             -- Other aid
                      from (select distinct
                                   spriden_pidm as pidm,
                                   spriden_id as banner_id,
                                   s2.study_id,
                                   dsc_term_code as dsc_term_code,
                                   spriden_last_name as last_name,
                                   spriden_first_name as first_name,
                                   spriden_mi as middle_name,
                                   case
                                       when (select count(distinct banner_term)
                                             from students03@dscir
                                             where dsc_pidm = spriden_pidm and s_year = 2020) >= 2 then decode(
                                           (select sum(sc_att_cr) / 10 - mod(sum(sc_att_cr) / 20, 3)
                                            from student_courses@dscir
                                            where dsc_pidm = spriden_pidm
                                              and sc_year = 2020
                                              and sc_extract = 'E'), 0, '9', -- Error, this shouldn't happen.
                                           3, '7', -- Less than Half-Time, Full-Year
                                           6, '5', -- Half-Time, Full-Year
                                           9, '3', -- 3/4-Time,  Full-Year
                                           12, '1', -- Full-Time, Full-Year
                                           '1') -- Full-Time, Full-Year
                                       else decode((select sum(sc_att_cr) / 10 - mod(sum(sc_att_cr) / 10, 3)
                                                    from student_courses@dscir
                                                    where dsc_pidm = spriden_pidm
                                                      and sc_year = 2020
                                                      and sc_extract = 'E'), 0, '9', -- Error, this shouldn't happen.
                                                   3, '8', -- Less than Half-Time, Full-Year
                                                   6, '6', -- Half-Time, One Term
                                                   9, '4', -- 3/4-Time,  One Term
                                                   12, '2', -- Full-Time, One Term
                                                   '1') -- Full-Time, One Term
                                   end as budget_period,

                                   nvl((select decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                        from rcrapp1
                                        where rcrapp1_pidm = spriden_pidm
                                          and rcrapp1_aidy_code = :main_EB_AidYear
                                          and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                       '-1') as student_residence,
                                   -- Found on IPEDS IC - Part D - Undergraduate Student Charges
                                   case
                                       when s_regent_res in ('A', 'M', 'R') then (4308 + 722)
                                       else (13776 + 772)
                                   end as tuition_and_fees,
                                   (select avg(rbrcomp_amt)
                                    from rbrcomp
                                    where rbrcomp_aidy_code = ':main_EB_AidYear'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = ':main_EB_AidYear'
                                                                                     and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                                                                  '-1')
                                                                             when '1' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '2' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '3' then '^(NONRES|RESID|GNNR)'
                                                                             else '^(NONRES|RESID|GNNR)'
                                                                         end)
                                      and rbrcomp_comp_code = 'B+S') as books_and_supplies,
                                   (select avg(rbrcomp_amt) + (30 * 82) -- Room and Board + ( Median Meal Plan Times 30 weeks )
                                    from rbrcomp
                                    where rbrcomp_aidy_code = ':main_EB_AidYear'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = ':main_EB_AidYear'
                                                                                     and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                                                                  '-1')
                                                                             when '1' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '2' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '3' then '^(NONRES|RESID|GNNR)'
                                                                             else '^(NONRES|RESID|GNNR)'
                                                                         end)
                                      and rbrcomp_comp_code = 'R+B') as room_and_board,
                                   (select avg(rbrcomp_amt)
                                    from rbrcomp
                                    where rbrcomp_aidy_code = ':main_EB_AidYear'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = ':main_EB_AidYear'
                                                                                     and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                                                                  '-1')
                                                                             when '1' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '2' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '3' then '^(NONRES|RESID|GNNR)'
                                                                             else '^(NONRES|RESID|GNNR)'
                                                                         end)
                                      and rbrcomp_comp_code = 'TRAN') as transportation,
                                   (select avg(rbrcomp_amt)
                                    from rbrcomp
                                    where rbrcomp_aidy_code = ':main_EB_AidYear'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = ':main_EB_AidYear'
                                                                                     and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                                                                  '-1')
                                                                             when '1' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '2' then '^(COMRES|COMNR|GNCOM)'
                                                                             when '3' then '^(NONRES|RESID|GNNR)'
                                                                             else '^(NONRES|RESID|GNNR)'
                                                                         end)
                                      and rbrcomp_comp_code = 'PERS') as computer_and_tech,
                                   0 as all_other,
                                   'calculated_in_outer_query' as budget_total,
                                   case
                                       when EXISTS(select 'Y'
                                                   from rorsapr
                                                   where rorsapr_pidm = spriden_pidm
                                                     and rorsapr_term_code in ('20193E', '20194E', '202023')
                                                     and rorsapr_sapr_code like 'P%') then 1
                                       else 0
                                   end as financial_aid_warning,   -- RORSAPR (table) rorsapr_term_code (term) rorsapr_sapr_code like P% = probation and S% = ineligibility
                                   case
                                       when EXISTS(select 'Y'
                                                   from rorsapr
                                                   where rorsapr_pidm = spriden_pidm
                                                     and rorsapr_term_code in ('20193E', '20194E', '202023')
                                                     and rorsapr_sapr_code like 'P%') then 1
                                       else 0
                                   end as financial_aid_probation, -- warning = probation at DSU
                                   case
                                       when EXISTS(select 'Y'
                                                   from rorsapr
                                                   where rorsapr_pidm = spriden_pidm
                                                     and rorsapr_term_code in ('20193E', '20194E', '202023')
                                                     and rorsapr_sapr_code like 'S%') then 1
                                       else 0
                                   end as financial_aid_ineligibility,
                                   case
                                       when EXISTS(select 'Y'
                                                   from rpratrm,
                                                        rfrbase
                                                   where rpratrm_pidm = spriden_pidm
                                                     and rpratrm_fund_code = rfrbase_fund_code
                                                     and rfrbase_fsrc_code = 'FDRL'
                                                     and rpratrm_orig_offer_amt > 0) then 1
                                       else 0
                                   end as federal_elegibility,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'FPELL'
                                      and rpratrm_period in ('201930', '201940', '202020')) as pell_grant,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DIRECT'
                                      and rpratrm_period in ('201930', '201940', '202020')) as direct,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DUSUB'
                                      and rpratrm_period in ('201930', '201940', '202020')) as unsubsidized,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DPLUS'
                                      and rpratrm_period in ('201930', '201940', '202020')) as plus,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'FPERK'
                                      and rpratrm_period in ('201930', '201940', '202020')) as perkins,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code in ('FSEOG', 'FSEOGS')
                                      and rpratrm_period in ('201930', '201940', '202020')) as seog,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code in ('FCWS', 'FCWSA')
                                      and rpratrm_period in ('201930', '201940', '202020')) as work_study,
                                   '' -- this isn't a required item and likely requires a lot of additional work to obtain. Leaving blank due to time constraints
                                       as veteran,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rpratrm_period in ('201930', '201940', '202020')
                                      and rfrbase_fsrc_code = 'STAT') as state_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code = 'STAT'
                                          and rpratrm_period in ('201930', '201940', '202020')), 0) as state_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rpratrm_period in ('201930', '201940', '202020')
                                      and rfrbase_fsrc_code in ('INST', 'PRES')) as institution_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code in ('INST', 'PRES')
                                          and rpratrm_period in ('201930', '201940', '202020')),
                                       0) as institution_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rfrbase_fsrc_code = 'PRIV'
                                      and rpratrm_period in ('201930', '201940', '202020')) as private_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code = 'PRIV'
                                          and rpratrm_period in ('201930', '201940', '202020')), 0) as private_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
                                      and rpratrm_period in ('201930', '201940', '202020')) as other_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
                                          and rpratrm_period in ('201930', '201940', '202020')), 0) as other_count,
                                   row_number() over (partition by dsc_pidm order by dsc_term_code desc) as rn
                            from students03@dscir,
                                 spbpers,
                                 spriden
                                 inner join ipeds_npsas_sample_data_2020@dscir s2 on '00' || student_id = spriden_id -- imported table with sampled students
                            where dsc_pidm = spbpers_pidm
                              and dsc_pidm = spriden_pidm
                              and s_entry_action <> 'HS'
                              and dsc_term_code in ('20193E', '20194E', '202023')
                              and spriden_change_ind is null
                              and (spbpers_confid_ind is null or spbpers_confid_ind <> 'Y')
                            order by spriden_last_name, spriden_first_name))

select 1 as file_spec_ver_num,
       '230171' as institute_id,
       study_id,
       banner_id as student_id,
--        first_name,
--        middle_name,
--        last_name,
       financial_aid_warning,
       financial_aid_probation,
       financial_aid_ineligibility,
       federal_elegibility,
       nvl(pell_grant, 0) as pell_grant,
       nvl(direct, 0) as subsidized_direct,
       unsubsidized,
       plus as parent_plus,
       '' as grad_plus,
       teach as fed_teach,
       perkins,
       seog as fed_seog,
       work_study as fed_work_study,
       service_grant,
       veteran,
       -- State Aid
       state_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_1
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_1) as state_program_1_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_1
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_2
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_2) as state_program_2_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_2
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_3
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_3) as state_program_3_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_3
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('201930', '201940', '202020')) as state_program_3_amount,
       -- Institution Aid
       institution_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_1
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_1_name,
       (select np_fund_type
        from npsas_fund_lookup
        where np_fund_code = institution_program_1) as institution_program_1_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_1
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_2
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_2_name,
       (select np_fund_type
        from npsas_fund_lookup
        where np_fund_code = institution_program_2) as institution_program_2_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_2
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_3
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_3_name,
       (select np_fund_type
        from npsas_fund_lookup
        where np_fund_code = institution_program_3) as institution_program_3_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_3
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as institution_program_3_amount,
       -- Private Aid
       private_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_1
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_1) as private_program_1_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_1
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_2
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_2) as private_program_2_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_2
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_3
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_3) as private_program_3_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_3
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('201930', '201940', '202020')) as private_program_3_amount,
       -- Other aid
       other_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_1
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_1) as other_program_1_type,
       case when other_program_1 is not null then 4 end as other_program_1_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_1
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_2
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_2) as other_program_2_type,
       case when other_program_2 is not null then 4 end as other_program_2_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_2
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_3
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_3) as other_program_3_type,
       case when other_program_3 is not null then 4 end as other_program_3_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_3
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('201930', '201940', '202020')) as other_program_3_amount
from student_list
where rn = 1;

------------------------------------------------------------------------------------------------------------------------------
-- end of file

 */