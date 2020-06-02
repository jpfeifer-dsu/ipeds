

with student_list as (select pidm,
                             banner_id,
                             s2.study_id,
                             dsc_term_code,
                             first_name,
                             middle_name,
                             last_name,
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
                                          and rcrapp1_aidy_code = 1920
                                          and (rcrapp1_curr_rec_ind = 'Y' or rcrapp1_curr_rec_ind is null)),
                                       '-1') as student_residence,
                                   -- Found on IPEDS IC - Part D - Undergraduate Student Charges
                                   case
                                       when s_regent_res in ('A', 'M', 'R') then (4308 + 722)
                                       else (13776 + 772)
                                   end as tuition_and_fees,
                                   (select avg(rbrcomp_amt)
                                    from rbrcomp
                                    where rbrcomp_aidy_code = '1920'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = '1920'
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
                                    where rbrcomp_aidy_code = '1920'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = '1920'
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
                                    where rbrcomp_aidy_code = '1920'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = '1920'
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
                                    where rbrcomp_aidy_code = '1920'
                                      and rbrcomp_btyp_code = 'CAMP'
                                      and rbrcomp_aprd_code = 'FA/SPR'
                                      and regexp_like(rbrcomp_bgrp_code, case nvl((select distinct
                                                                                          decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                                                   from rcrapp1
                                                                                   where rcrapp1_pidm = spriden_pidm
                                                                                     and rcrapp1_aidy_code = '1920'
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
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as pell_grant,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DIRECT'
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as direct,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DUSUB'
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as unsubsidized,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'DPLUS'
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as plus,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code = 'FPERK'
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as perkins,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code in ('FSEOG', 'FSEOGS')
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as seog,
                                   (select sum(rpratrm_orig_offer_amt)
                                    from rpratrm
                                    where rpratrm_pidm = spriden_pidm
                                      and rpratrm_fund_code in ('FCWS', 'FCWSA')
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as work_study,
                                   '' -- this isn't a required item and likely requires a lot of additional work to obtain. Leaving blank due to time constraints
                                       as veteran,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rpratrm_period in ('20193E', '20194E', '202023')
                                      and rfrbase_fsrc_code = 'STAT') as state_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code = 'STAT'
                                          and rpratrm_period in ('20193E', '20194E', '202023')), 0) as state_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rpratrm_period in ('20193E', '20194E', '202023')
                                      and rfrbase_fsrc_code in ('INST', 'PRES')) as institution_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code in ('INST', 'PRES')
                                          and rpratrm_period in ('20193E', '20194E', '202023')),
                                       0) as institution_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rfrbase_fsrc_code = 'PRIV'
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as private_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code = 'PRIV'
                                          and rpratrm_period in ('20193E', '20194E', '202023')), 0) as private_count,
                                   (select rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code, '`')
                                                                         within group (order by rfrbase_fund_code)),
                                                                '([^`]*)(`\1)+($|`)', '\1\3'), '`')
                                    from rpratrm,
                                         rfrbase
                                    where rpratrm_pidm = spriden_pidm
                                      and rfrbase_fund_code = rpratrm_fund_code
                                      and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
                                      and rpratrm_period in ('20193E', '20194E', '202023')) as other_programs,
                                   nvl((select count(distinct rfrbase_fund_code)
                                        from rpratrm,
                                             rfrbase
                                        where rpratrm_pidm = spriden_pidm
                                          and rfrbase_fund_code = rpratrm_fund_code
                                          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
                                          and rpratrm_period in ('20193E', '20194E', '202023')), 0) as other_count,
                                   row_number() over (partition by dsc_pidm order by dsc_term_code desc) as rn
                            from students03@dscir,
                                 spbpers,
                                 spriden
                            inner join ipeds_npsas_sample_data_2020@dscir s2 on '00' || student_id = spriden_id  -- imported table with sampled students
                            where dsc_pidm = spbpers_pidm
                              and dsc_pidm = spriden_pidm
                              and s_entry_action <> 'HS'
                              and dsc_term_code in ('20193E', '20194E', '202023')
                              and spriden_change_ind is null
                              and (spbpers_confid_ind is null or spbpers_confid_ind <> 'Y')
                            order by spriden_last_name, spriden_first_name))
select 1 as file_spec_ver_num,
       '230171' as institute_id,
       '=VLOOKUP([@[Student-ID]],Table19[#All],2,FALSE)' as study_id,
       banner_id as student_id,
--             first_name,
--             middle_name,
--             last_name,
       budget_period,
       student_residence,
       tuition_and_fees,
       books_and_supplies,
       room_and_board,
       health_insurance,
       transportation,
       computer_and_tech,
       all_other,
       budget_total/**/,
       financial_aid_warning,
       financial_aid_probation,
       financial_aid_ineligibility,
       federal_elegibility,
       nvl(pell_grant, 0),
       nvl(direct, 0),
       unsubsidized,
       plus as parent_plus,
       '' as grad_plus,
       teach,
       perkins,
       seog,
       work_study,
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
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_1) as state_program_1_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_1
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_2
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_2) as state_program_2_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_2
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_3
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = state_program_3) as state_program_3_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = state_program_3
          and rfrbase_fsrc_code = 'STAT'
          and rpratrm_period in ('20193E', '20194E', '202023')) as state_program_3_amount,
       -- Institution Aid
       institution_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_1
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_1_name,
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
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_2
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_2_name,
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
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = institution_program_3
          and rfrbase_fsrc_code in ('INST', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_3_name,
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
          and rpratrm_period in ('20193E', '20194E', '202023')) as institution_program_3_amount,
       -- Private Aid
       private_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_1
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_1) as private_program_1_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_1
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_2
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_2) as private_program_2_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_2
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_3
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = private_program_3) as private_program_3_type,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = private_program_3
          and rfrbase_fsrc_code = 'PRIV'
          and rpratrm_period in ('20193E', '20194E', '202023')) as private_program_3_amount,
       -- Other aid
       other_aid,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_1
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_1_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_1) as other_program_1_type,
       case when other_program_1 is not null then 4 end as other_program_1_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_1
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_1_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_2
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_2_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_2) as other_program_2_type,
       case when other_program_2 is not null then 4 end as other_program_2_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_2
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_2_amount,
       (select distinct rfrbase_fund_title
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_3
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_3_name,
       (select np_fund_type from npsas_fund_lookup where np_fund_code = other_program_3) as other_program_3_type,
       case when other_program_3 is not null then 4 end as other_program_3_source,
       (select SUM(rpratrm_orig_offer_amt)
        from rpratrm,
             rfrbase
        where rpratrm_pidm = pidm
          and rfrbase_fund_code = rpratrm_fund_code
          and rpratrm_fund_code = other_program_3
          and rfrbase_fsrc_code not in ('STAT', 'INST', 'PRIV', 'FDRL', 'PRES')
          and rpratrm_period in ('20193E', '20194E', '202023')) as other_program_3_amount/**/
from student_list
where rn = 1;

------------------------------------------------------------------------------------------------------------------------------
/*
SELECT shrdgmr_acyr_code, prgm_code, count(*) AS graduates
FROM   shrdgmr
       LEFT JOIN dsc_programs_current ON shrdgmr_program = prgm_code
WHERE  shrdgmr_degs_code IN ('AW','PN')
AND    school_code = 'BU'
AND    shrdgmr_degc_code LIKE 'C%'
GROUP  BY prgm_code, shrdgmr_acyr_code
ORDER  BY shrdgmr_acyr_code, prgm_code;


SELECT DISTINCT rfrbase_fund_code, rfrbase_fund_code
FROM   rpratrm, rfrbase
WHERE  rfrbase_fund_code = rpratrm_fund_code
AND    rpratrm_period   IN ('20193E', '20194E', '202023');

-- end of file