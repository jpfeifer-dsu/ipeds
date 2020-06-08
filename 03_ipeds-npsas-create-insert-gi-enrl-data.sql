------------------------------------------------------------------------------------------------------------
/*
    2019-20 National Postsecondary Student Aid Study - Student Enrollment List

    A sample of students will be randomly selected from the list of enrolled students that you
    provide, and will be combined with samples selected from other institutions to form a nationally
    representative sample of postsecondary students. To ensure a scientifically valid sample, it is
    extremely important that you follow the instructions provided in this document when preparing
    your institution’s list. We realize that postsecondary institutions vary widely in their
    organizational structures, and that some of the criteria presented below may not apply to your
    institution.
 */
------------------------------------------------------------------------------------------------------------

drop table enroll.ipeds_npsas_sample_20;
create table enroll.ipeds_npsas_sample_20
(
    -- General -----------------------------------------------------------------------------------------------------------------
    ipeds_fsvn              varchar2(2),   -- File Specification Version Number
    ipeds_instid            varchar2(6),   -- Institute ID
    ipeds_studyid           varchar2(8),   -- Study ID
    dsu_term                varchar2(6),   --
    dsu_pidm                varchar2(9),   --
    dsu_hsgrad_dt           varchar2(8),   --
    ipeds_studentid         varchar2(20),  -- Student ID
    first_name              varchar2(50),  -- First Name
    middle_name             varchar2(50),  -- Middle Name
    last_name               varchar2(50),  -- Last Name
    suffix                  varchar2(10),  -- Suffix
    ssn                     varchar2(9),   -- SSN
    dob_month               varchar2(2),   -- DOB Month
    dob_day                 varchar2(2),   -- DOB Day
    dob_year                varchar2(4),   -- DOB Year
    gender                  varchar2(2),   -- Sex
    npsas_eligible          varchar2(1),   -- Student is eligible for NPSAS:18-AC?
    ineligible_reason       varchar2(2),   -- Ineligible Reason
    marital_status          varchar2(2),   -- Marital Status
    maiden_name             varchar2(50),  -- Maiden Name
    spouse_first_name       varchar2(50),  -- Spouse First Name
    spouse_middle_name      varchar2(50),  -- Spouse Middle Name
    spouse_last_name        varchar2(50),  -- Spouse Last Name
    citizenship_status      varchar2(2),   -- Citizenship Status
    veteran_status          varchar2(2),   -- Veteran Status
    hs_completion_type      varchar2(2),   -- High School Completion Type
    hs_completion_year      varchar2(4),   -- High School Completion Year
    ethnicity               varchar2(2),   -- Ethnicity
    race_white              varchar2(2),   -- Race: White
    race_black              varchar2(2),   -- Race: Black or African American
    race_asian              varchar2(2),   -- Race: Asian
    race_indian             varchar2(2),   -- Race: American Indian or Alaska Native
    race_hawaiian           varchar2(2),   -- Race: Native Hawaiian or addtl Pacific Islander
    perm_add_line1          varchar2(100), -- Permanent Address Line 1
    perm_add_line2          varchar2(50),  -- Permanent Address Line 2
    perm_add_city           varchar2(50),  -- Permanent Address City
    perm_add_state          varchar2(2),   -- Permanent Address State
    perm_add_zip            varchar2(9),   -- Permanent Address Zip
    perm_add_country        varchar2(50),  -- Permanent Address Country (if not USA)
    is_perm_resd            varchar2(2),   -- Is the student a permanent resident of the state in which your institution is located?
    local_add_line1         varchar2(100), -- Local/Most Recent Address Line 1
    local_add_line2         varchar2(100), -- Local/Most Recent Address Line 2
    local_add_city          varchar2(50),  -- Local/Most Recent Address City
    local_add_state         varchar2(2),   -- Local/Most Recent Address State
    local_add_zip           varchar2(9),   -- Local/Most Recent Address Zip
    phone1_number           varchar2(10),  -- Phone 1 Number
    phone1_type             varchar2(1),   -- Phone 1 Type
    phone2_number           varchar2(10),  -- Phone 2 Number
    phone2_type             varchar2(1),   -- Phone 2 Type
    email_campus            varchar2(100), -- Campus Email
    email_personal          varchar2(100), -- Personal Email
    parent_first_name       varchar2(50),  -- Parent First Name
    parent_middle_name      varchar2(50),  -- Parent Middle Name
    parent_last_name        varchar2(50),  -- Parent Last Name
    parent_suffix           varchar2(10),  -- Parent Suffix
    parent_add_line1        varchar2(100), -- Parent Address Line 1
    parent_add_line2        varchar2(100), -- Parent Address Line 2
    parent_add_city         varchar2(50),  -- Parent Address City
    parent_add_state        varchar2(2),   -- Parent Address State or Province
    parent_add_zip          varchar2(9),   -- Parent Address Zip
    parent_add_country      varchar2(50),  -- Parent Country (if not USA)
    parent_email            varchar2(100), -- Parent Email
    parent_phone            varchar2(10),  -- Parent Phone
    parent_cell             varchar2(10),  -- Parent Cell Phone
    parent_int_phone        varchar2(20),  -- Parent International Phone
    other_first_name        varchar2(50),  -- Other Contact First Name
    other_middle_name       varchar2(50),  -- Other Contact Middle Name
    other_last_name         varchar2(50),  -- Other Contact Last Name
    other_suffix            varchar2(10),  -- Other Contact Suffix
    other_relation          varchar2(2),   -- Relationship of Other Contact to Student
    other_add_line1         varchar2(100), -- Other Contact Address Line 1
    other_add_line2         varchar2(100), -- Other Contact Address Line 2
    other_add_city          varchar2(50),  -- Other Contact Address City
    other_add_state         varchar2(2),   -- Other Contact Address State or Province
    other_add_zip           varchar2(9),   -- Other Contact Address Zip
    other_add_country       varchar2(50),  -- Other Contact Country (if not USA)
    other_email             varchar2(100), -- Other Contact Email
    other_phone             varchar2(10),  -- Other Phone
    other_cell              varchar2(10),  -- Other Cell Phone
    -- Enrollment --------------------------------------------------------------------------------------------------------------
    first_enrl_month        varchar2(2),   -- Date First Enrolled at this Institution (Month)
    first_enrl_day          varchar2(2),   -- Date First Enrolled at this Institution (Day)
    first_enrl_year         varchar2(4),   -- Date First Enrolled at this Institution (Year)
    last_enrl_month         varchar2(2),   -- Date Last Enrolled at this Institution (Month)
    last_enrl_day           varchar2(2),   -- Date Last Enrolled at this Institution (Day)
    last_enrl_year          varchar2(4),   -- Date Last Enrolled at this Institution (Year)

    degree_by_063020        varchar2(1),   -- Expected to complete degree requirements before June 30, 2020?
    has_xfer_hours          varchar2(1),   -- Has your institution accepted transfer credit for this student from another postsecondary institution?
    has_rem_dev_hours       varchar2(2),   -- Since completing high school, has the student taken any remedial/developmental courses to improve their basic skills in English, math, reading, or writing?
    is_first_time_stu       varchar2(1),   -- First-time Beginning Student?
    has_bach_degree         varchar2(2),   -- Ever Received Baccalaureate Degree?
    bach_rec_month          varchar2(2),   -- Date Baccalaureate Received (Month)
    bach_rec_day            varchar2(2),   -- Date Baccalaureate Received (Day)
    bach_rec_year           varchar2(4),   -- Date Baccalaureate Received (Year)
    act_engl_score          varchar2(4),   -- ACT English Score
    act_math_score          varchar2(4),   -- ACT Mathematics Score
    act_read_score          varchar2(4),   -- ACT Reading Score
    act_sci_score           varchar2(4),   -- ACT Science Score
    act_comp_score          varchar2(4),   -- ACT Composite Score
    sat_read_score          varchar2(4),   -- SAT Critical Reading Score
    sat_math_score          varchar2(4),   -- SAT Mathematics Score
    sat_essay_score         varchar2(4),   -- SAT Essay Score

    program_ay1920          varchar2(2),   -- Program/Degree (2019-2020 academic year)
    grad_degree_ay1920      varchar2(2),   -- Graduate Degree Type (FOR GRADUATE DEGREES ONLY) (2019-2020 academic year)
    class_level_ay1920      varchar2(2),   -- Class Level (2019-2020 academic year)
    grad_month_ay1920       varchar2(2),   -- Degree Completion Date (Month) (FOR COMPLETED DEGREES) (2019-2020 academic year)
    grad_day_ay1920         varchar2(2),   -- Degree Completion Date (Day) (FOR COMPLETED DEGREES) (2019-2020 academic year)
    grad_year_ay1920        varchar2(4),   -- Degree Completion Date (Year) (FOR COMPLETED DEGREES) (2019-2020 academic year)
    cum_gpa_ay1920          varchar2(10),  -- Cumulative (Unweighted) GPA (2019-2020 academic year)
    major1_ay1920           varchar2(128), -- First Major (2019-2020 academic year)
    cip1_ay1920             varchar2(6),   -- First Major CIP Code (NNNNNN) (2019-2020 academic year)
    major2_ay1920           varchar2(128), -- Second Major (2019-2020 academic year)
    cip2_ay1920             varchar2(6),   -- Second Major CIP Code (NNNNNN) (2019-2020 academic year)
    undeclared_ay1920       varchar2(1),   -- Major Undeclared (2019-2020 academic year)
    prgm_hrs_ay1920         varchar2(10),  -- Total Number of Clock Hours in Program (2019-2020 academic year)
    hrs_clock_ay1920        varchar2(10),  -- Cumulative Clock Hours Completed (2019-2020 academic year)
    hrs_credit_ay1920       varchar2(10),  -- Total Number of Credit Hours in Program (2019-2020 academic year)
    cum_credits_ay1920      varchar2(10),  -- Cumulative Credit Hours Completed (2019-2020 academic year)
    tuition_ay1920          varchar2(10),  -- TotalTuition and Mandatory Fees Charged ($) (2019-2020 academic year)
    tuition_covid19_ay1920  number(10),  -- Tuition and Fees Refunded for COVID-19 ($) (2019-2020 academic year)
    rb_covid19_ay1920       number(10),   -- Room and board refunded for COVID-19 (2019-2020 academic year)
    residency_ay1920        varchar2(2),   -- Residency for Tuition Purposes (2019-2020 academic year)

    enroll_summer_ptft_2019 varchar2(10),  -- Enrollment Status (Summer 2019)
    enroll_summer_hrs_2019  varchar2(10),  -- Credit Units (Summer 2019)
    enroll_fall_ptft_2019   varchar2(10),  -- Enrollment Status (Fall 2019)
    enroll_fall_hrs_2019    varchar2(10),  -- Credit Units (Fall 2019)
    enroll_spring_ptft_2020 varchar2(10),  -- Enrollment Status (Spring 2020)
    enroll_spring_hrs_2020  varchar2(10),  -- Credit Units (Spring 2020)
    enroll_summer_ptft_2020 varchar2(10),  -- Enrollment Status (Summer 2020)
    enroll_summer_hrs_2020  varchar2(10)   -- Credit Units (Summer 2020)
);

------------------------------------------------------------------------------------------------------------
-- Add Students

insert into enroll.ipeds_npsas_sample_20 (ipeds_fsvn,
                                          npsas_eligible,
                                          ipeds_studyid,
                                          dsu_term,
                                          dsu_pidm,
                                          ipeds_instid,
                                          first_name,
                                          middle_name,
                                          last_name,
                                          suffix,
                                          ipeds_studentid,
                                          ssn,
                                          dob_month,
                                          dob_day,
                                          dob_year,
                                          gender,
                                          ethnicity,
                                          major1_ay1920,
                                          cip1_ay1920,
                                          major2_ay1920,
                                          cip2_ay1920,
                                          dsu_hsgrad_dt,
                                          hs_completion_year,
                                          hs_completion_type,
                                          marital_status,
                                          undeclared_ay1920,
                                          grad_month_ay1920,
                                          grad_day_ay1920,
                                          grad_year_ay1920)

select '1' as ipeds_fsvn,
       '1' as npsas_eligible,
       s2.study_id as ipeds_studyid,
       MAX(banner_term),
       dsc_pidm,
       '230171' as ipeds_unitid,
       s_first,
       nvl(s_middle, ' ') as s_middle,
       s_last,
       nvl(s_suffix, ' ') as s_suffix,
       spriden_id,
       spbpers_ssn,
       substr(s_birth_dt, 5, 2) as s_dob_month,
       substr(s_birth_dt, 7, 2) as s_dob_day,
       substr(s_birth_dt, 1, 4) as s_dob_year,
       case s_gender when 'M' then 0 else 1 end as s_gender,
       s_ethnic,
       cur_majr1,
       s_curr_cip,
       cur_majr2,
       s_curr_cip2,
       dsc_hsgrad_dt,
       substr(dsc_hsgrad_dt, 1, 4) as hs_completion_year,
       case
           when dsc_hsgrad_dt is null then null
           when s_high_school = '459995' then 2 -- GED
           when s_high_school = '459996' then -1 -- Unknown High School
           when s_high_school = '459998' then 5 -- Home-Schooling
           when s_high_school = '459999' then 4 -- Foreign High School
           else 1
       end as hs_completion_type,
       case s1.marital_status when 'S' then 0 when 'M' then 1 else -1 end,
       case when cur_majr1 in ('ND', 'CE', 'GE') then 1 else 0 end as undeclared_ay1920,
       (select to_char(shrdgmr_grad_date, 'MM')
        from shrdgmr
        where shrdgmr_pidm = dsc_pidm
          and shrdgmr_degc_code = cur_degc1
          and shrdgmr_acyr_code = '1920'
          and shrdgmr_degs_code in ('AW', 'PN')) as grad_month_ay1920,
       (select to_char(shrdgmr_grad_date, 'DD')
        from shrdgmr
        where shrdgmr_pidm = dsc_pidm
          and shrdgmr_degc_code = cur_degc1
          and shrdgmr_acyr_code = '1920'
          and shrdgmr_degs_code in ('AW', 'PN')) as grad_day_ay1920,
       (select to_char(shrdgmr_grad_date, 'YYYY')
        from shrdgmr
        where shrdgmr_pidm = dsc_pidm
          and shrdgmr_degc_code = cur_degc1
          and shrdgmr_acyr_code = '1920'
          and shrdgmr_degs_code in ('AW', 'PN')) as grad_year_ay1920
from students03@dscir s1,
     spbpers,
     spriden
     inner join ipeds_npsas_sample_data_2020@dscir s2 on '00' || student_id = spriden_id  -- imported table with sampled students
where dsc_pidm = spbpers_pidm
  and dsc_pidm = spriden_pidm
  and s_entry_action <> 'HS'
  and dsc_term_code in ('20193E', '20194E', '202023')
  and spriden_change_ind is null
  and (spbpers_confid_ind is null or spbpers_confid_ind <> 'Y')
  and dsc_term_code = (select max(dsc_term_code)
                       from students03@dscir s2
                       where s2.dsc_pidm = s1.dsc_pidm
                         and s2.s_entry_action <> 'HS'
                         and s2.dsc_term_code in ('20193E', '20194E', '202023'))
group by dsc_pidm, s2.study_id, s_first, nvl(s_middle, ' '), s_last, nvl(s_suffix, ' '), spriden_id, spbpers_ssn,
         substr(s_birth_dt, 5, 2), substr(s_birth_dt, 7, 2), substr(s_birth_dt, 1, 4),
         case s_gender when 'M' then 0 else 1 end, case marital_status when 'S' then 0 when 'M' then 1 else -1 end,
         s_ethnic, cur_majr1, s_curr_cip, cur_degc1, cur_majr2, s_curr_cip2, dsc_hsgrad_dt, substr(dsc_hsgrad_dt, 1, 4),
         case
             when dsc_hsgrad_dt is null then null
             when s_high_school = '459995' then 2 -- GED
             when s_high_school = '459996' then -1 -- Unknown High School
             when s_high_school = '459998' then 5 -- Home-Schooling
             when s_high_school = '459999' then 4 -- Foreign High School
             else 1
         end, case substr(cur_degc1, 1, 1) when 'B' then '4' when 'A' then '3' when 'C' then '2' else '1' end;

------------------------------------------------------------------------------------------------------------

-- Veteran Status
update enroll.ipeds_npsas_sample_20
set veteran_status = case when EXISTS(select 1 from sgrvetn where sgrvetn_pidm = dsu_pidm) then 1 else 0 end;

-- Ethnicities
update enroll.ipeds_npsas_sample_20
set race_white = case when ethnicity = 'W' then 1 else 0 end;
update enroll.ipeds_npsas_sample_20
set race_black = case when ethnicity = 'B' then 1 else 0 end;
update enroll.ipeds_npsas_sample_20
set race_asian = case when ethnicity = 'A' then 1 else 0 end;
update enroll.ipeds_npsas_sample_20
set race_indian = case when ethnicity = 'I' then 1 else 0 end;
update enroll.ipeds_npsas_sample_20
set race_hawaiian = case when ethnicity = 'P' then 1 else 0 end;
update enroll.ipeds_npsas_sample_20
set ethnicity = case when ethnicity = 'H' then 1 when ethnicity = 'U' then -1 else 0 end;

-- Permanent Address
update enroll.ipeds_npsas_sample_20
set perm_add_line1   = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'street1'),
    perm_add_line2   = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'street2'),
    perm_add_city    = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'city'),
    perm_add_state   = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'state'),
    perm_add_country = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'country'),
    perm_add_zip     = dsc.f_get_formatted_addr(dsu_pidm, 'CC_PERM', 'zip');

-- Student's Local Address, City, State and Zip Code
update enroll.ipeds_npsas_sample_20
set local_add_line1 = dsc.f_get_formatted_addr(dsu_pidm, 'CC_LOCAL', 'street1'),
    local_add_line2 = dsc.f_get_formatted_addr(dsu_pidm, 'CC_LOCAL', 'street2'),
    local_add_city  = dsc.f_get_formatted_addr(dsu_pidm, 'CC_LOCAL', 'city'),
    local_add_state = dsc.f_get_formatted_addr(dsu_pidm, 'CC_LOCAL', 'state'),
    local_add_zip   = dsc.f_get_formatted_addr(dsu_pidm, 'CC_LOCAL', 'zip');

-- Indicator: Is student permanent resident of state of institution
update enroll.ipeds_npsas_sample_20
set is_perm_resd = case (select s1.sgbstdn_resd_code
                         from sgbstdn s1
                         where s1.sgbstdn_pidm = dsu_pidm
                           and s1.sgbstdn_term_code_eff =
                               (select MAX(s2.sgbstdn_term_code_eff) from sgbstdn s2 where s2.sgbstdn_pidm = dsu_pidm))
                       when 'A' then 1
                       when 'C' then 1
                       when 'G' then 0
                       when 'N' then 0
                       when 'R' then 1
                       else -1
                   end;

-- Spouse's Information
update enroll.ipeds_npsas_sample_20
set spouse_first_name  = (select spremrg_first_name
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('P', 'X')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('P', 'X'))),
    spouse_middle_name = (select spremrg_mi
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('P', 'X')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('P', 'X'))),
    spouse_last_name   = (select spremrg_last_name
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('P', 'X')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('P', 'X')));

-- Citizenship Status
update enroll.ipeds_npsas_sample_20
set citizenship_status = (select case spbpers_citz_code when '1' then 1 when '2' then 3 when '3' then 2 else -1 end
                          from spbpers
                          where spbpers_pidm = dsu_pidm);

-- Student's Local Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone1_number = dsc.f_get_formatted_tele(sprtele_pidm, 'LOCPERM', 'none');

update enroll.ipeds_npsas_sample_20
set phone1_type = '1'
where phone1_number is not null;

-- Student's Cell Phone Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone2_number = dsc.f_get_formatted_tele(sprtele_pidm, 'CELLTELE', 'none');

update enroll.ipeds_npsas_sample_20
set phone2_type = '2'
where phone2_number is not null;

-- Student's Work Phone Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone1_number = (select substr(s1.sprtele_phone_area || s1.sprtele_phone_number, 1, 10)
                     from sprtele s1
                     where s1.sprtele_pidm = dsu_pidm
                       and s1.sprtele_tele_code = 'WK'
                       and LENGTH(trim(translate(s1.sprtele_phone_area, ' +-.0123456789', ' '))) is null
                       and LENGTH(s1.sprtele_phone_area) = '3'
                       and s1.sprtele_seqno = (select MAX(s2.sprtele_seqno)
                                               from sprtele s2
                                               where s2.sprtele_pidm = s1.sprtele_pidm
                                                 and s2.sprtele_tele_code = 'WK'
                                                 and LENGTH(
                                                         trim(translate(s1.sprtele_phone_area, ' +-.0123456789', ' '))) is null
                                                 and LENGTH(s1.sprtele_phone_area) = '3'))
where phone1_number is null;

update enroll.ipeds_npsas_sample_20
set phone1_type = '3'
where phone1_number is not null
  and phone1_type is null;

-- Student's Other Phone Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone1_number = (select substr(s1.sprtele_phone_area || s1.sprtele_phone_number, 1, 10)
                     from sprtele s1
                     where s1.sprtele_pidm = dsu_pidm
                       and LENGTH(trim(translate(s1.sprtele_phone_area, ' +-.0123456789', ' '))) is null
                       and LENGTH(s1.sprtele_phone_area) = '3'
                       and s1.sprtele_seqno = (select MAX(s2.sprtele_seqno)
                                               from sprtele s2
                                               where s2.sprtele_pidm = s1.sprtele_pidm
                                                 and LENGTH(
                                                         trim(translate(s1.sprtele_phone_area, ' +-.0123456789', ' '))) is null
                                                 and LENGTH(s1.sprtele_phone_area) = '3'))
where phone1_number is null;

update enroll.ipeds_npsas_sample_20
set phone1_type = '4'
where phone1_number is not null
  and phone1_type is null;

-- Student's Campus Email Address
update enroll.ipeds_npsas_sample_20
set email_campus = (select goremal_email_address
                    from goremal
                    where rowid = dsc.f_get_email_rowid(dsu_pidm, 'STU_EMAIL', 'A', 1));

-- Student's Personal Email Address
update enroll.ipeds_npsas_sample_20
set email_personal = (select goremal_email_address
                      from goremal
                      where rowid = dsc.f_get_email_rowid(dsu_pidm, 'P_EMAIL', 'A', 1));

-- Parent's Information
update enroll.ipeds_npsas_sample_20
set parent_first_name  = (select spremrg_first_name
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_middle_name = (select spremrg_mi
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_last_name   = (select spremrg_last_name
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_line1   = (select spremrg_street_line1
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_line2   = (select spremrg_street_line2
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_city    = (select spremrg_city
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_state   = (select spremrg_stat_code
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_zip     = (select substr(regexp_replace(spremrg_zip, '[^0-9]', ''), 1, 5)
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_add_country = (select spremrg_natn_code
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))
                            and spremrg_natn_code <> 'US'),
    parent_phone       = (select regexp_replace(spremrg_phone_area || spremrg_phone_number, '[^0-9]', '')
                          from spremrg
                          where spremrg_pidm = dsu_pidm
                            and spremrg_relt_code in ('M', 'F')
                            and length(regexp_replace(spremrg_phone_area || spremrg_phone_number, '[^0-9]', '')) = 10
                            and spremrg_priority = (select MAX(spremrg_priority)
                                                    from spremrg
                                                    where spremrg_pidm = dsu_pidm and spremrg_relt_code in ('M', 'F'))),
    parent_email       = (select goremal_email_address
                          from goremal
                          where goremal_pidm = dsu_pidm and goremal_emal_code = 'PAR' and rownum = 1);

update enroll.ipeds_npsas_sample_20
set parent_first_name  = (select sorfolk_parent_first
                          from sorfolk
                          where sorfolk_pidm = dsu_pidm and sorfolk_relt_code in ('M', 'F') and rownum = 1),
    parent_middle_name = (select sorfolk_parent_mi
                          from sorfolk
                          where sorfolk_pidm = dsu_pidm and sorfolk_relt_code in ('M', 'F') and rownum = 1),
    parent_last_name   = (select sorfolk_parent_last
                          from sorfolk
                          where sorfolk_pidm = dsu_pidm and sorfolk_relt_code in ('M', 'F') and rownum = 1)
where parent_first_name is null
  and parent_last_name is null;



-- Other Contact's Information
-- Excludes spouse and parent information since it's already been provided.
update enroll.ipeds_npsas_sample_20
set other_first_name  = (select spremrg_first_name
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_middle_name = (select spremrg_mi
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_last_name   = (select spremrg_last_name
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_relation    = (select case spremrg_relt_code
                                    when 'M' then 1
                                    when 'F' then 1
                                    when 'U' then 2
                                    when 'S' then 3
                                    when 'B' then 3
                                    when 'T' then 4
                                    when 'G' then 6
                                    when 'P' then 7
                                    when 'R' then 8
                                    else 10
                                end
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_add_line1   = (select spremrg_street_line1
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_add_line2   = (select spremrg_street_line2
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_add_city    = (select spremrg_city
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_add_state   = (select spremrg_stat_code
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_add_zip     = (select regexp_replace(spremrg_zip, '[^0-9]', '')
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority =
                               (select MAX(spremrg_priority) from spremrg where spremrg_pidm = dsu_pidm)),
    other_add_country = (select spremrg_natn_code
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name)),
    other_phone       = (select regexp_replace(spremrg_phone_area || spremrg_phone_number, '[^0-9]', '')
                         from spremrg
                         where spremrg_pidm = dsu_pidm
                           and spremrg_first_name || spremrg_last_name != parent_first_name || parent_last_name
                           and spremrg_first_name || spremrg_last_name != spouse_first_name || spouse_last_name
                           and length(regexp_replace(spremrg_phone_area || spremrg_phone_number, '[^0-9]', '')) = 10
                           and spremrg_priority = (select MAX(spremrg_priority)
                                                   from spremrg
                                                   where spremrg_pidm = dsu_pidm
                                                     and LENGTH(
                                                             regexp_replace(spremrg_phone_area || spremrg_phone_number,
                                                                            '[^0-9]', '')) = 10
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         parent_first_name || parent_last_name
                                                     and spremrg_first_name || spremrg_last_name !=
                                                         spouse_first_name || spouse_last_name));

-- Date of First Enrollment
update enroll.ipeds_npsas_sample_20
set first_enrl_month = nvl((select to_char(stvterm_start_date, 'MM')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and dsc_pidm = dsu_pidm
                              and s_entry_action in ('FF', 'FH', 'TU')
                              and s_term || s_extract in ('1E', '23', '33')
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action in ('FF', 'FH', 'TU'))),
                           (select to_char(stvterm_start_date, 'MM')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and s_entry_action <> 'HS'
                              and dsc_pidm = dsu_pidm
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action <> 'HS'))),
    first_enrl_day   = nvl((select to_char(stvterm_start_date, 'DD')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and dsc_pidm = dsu_pidm
                              and s_entry_action in ('FF', 'FH', 'TU')
                              and s_term || s_extract in ('1E', '23', '33')
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action in ('FF', 'FH', 'TU'))),
                           (select to_char(stvterm_start_date, 'DD')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and s_entry_action <> 'HS'
                              and dsc_pidm = dsu_pidm
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action <> 'HS'))),
    first_enrl_year  = nvl((select to_char(stvterm_start_date, 'YYYY')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and dsc_pidm = dsu_pidm
                              and s_entry_action in ('FF', 'FH', 'TU')
                              and s_term || s_extract in ('1E', '23', '33')
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action in ('FF', 'FH', 'TU'))),
                           (select to_char(stvterm_start_date, 'YYYY')
                            from stvterm,
                                 students03@dscir
                            where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                              and s_entry_action <> 'HS'
                              and dsc_pidm = dsu_pidm
                              and dsc_term_code = (select MIN(dsc_term_code)
                                                   from students03@dscir
                                                   where dsc_pidm = dsu_pidm and s_entry_action <> 'HS')));


-- Date of First Enrollment
update enroll.ipeds_npsas_sample_20
set first_enrl_month = (select to_char(stvterm_start_date, 'MM')
                        from stvterm,
                             students03@dscir
                        where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                          and dsc_pidm = dsu_pidm
                          and dsc_term_code =
                              (select MIN(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm)),
    first_enrl_day   = (select to_char(stvterm_start_date, 'DD')
                        from stvterm,
                             students03@dscir
                        where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                          and dsc_pidm = dsu_pidm
                          and dsc_term_code =
                              (select MIN(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm)),
    first_enrl_year  = (select to_char(stvterm_start_date, 'YYYY')
                        from stvterm,
                             students03@dscir
                        where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                          and dsc_pidm = dsu_pidm
                          and dsc_term_code =
                              (select MIN(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm))
where first_enrl_month is null
   or first_enrl_day is null
   or first_enrl_year is null;

-- Date of Last Enrollment
update enroll.ipeds_npsas_sample_20
set last_enrl_month = (select to_char(stvterm_end_date, 'MM')
                       from stvterm,
                            students03@dscir
                       where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                         and dsc_pidm = dsu_pidm
                         and dsc_term_code =
                             (select MAX(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm)),
    last_enrl_day   = (select to_char(stvterm_end_date, 'DD')
                       from stvterm,
                            students03@dscir
                       where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                         and dsc_pidm = dsu_pidm
                         and dsc_term_code =
                             (select MAX(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm)),
    last_enrl_year  = (select to_char(stvterm_end_date, 'YYYY')
                       from stvterm,
                            students03@dscir
                       where stvterm_code = substr(dsc_term_code, 1, 5) || 0
                         and dsc_pidm = dsu_pidm
                         and dsc_term_code =
                             (select MAX(dsc_term_code) from students03@dscir where dsc_pidm = dsu_pidm));
-- Transfer Credits Indicator
update enroll.ipeds_npsas_sample_20
set has_xfer_hours = case
                         when EXISTS(select 1 from students03@dscir where dsc_pidm = dsu_pidm and s_trans_total > 0)
                             then 1
                         else 0
                     end;


-- Remedial Credits Indicator
update enroll.ipeds_npsas_sample_20
set has_rem_dev_hours = case
                            when EXISTS(select 1
                                        from as_academic_history_detail
                                        where dsu_pidm = pidm_key
                                          and ((subj_code = ('MATH') and
                                                (crse_number like '0%' or crse_number in ('1000', '1010'))) or
                                               (subj_code = ('ENGL') and (crse_number like '0%' or crse_number = ('1470')))))
                                then 1
                            else 0
                        end;


-- First-time Student
update enroll.ipeds_npsas_sample_20
set is_first_time_stu = case
                            when EXISTS(select 1
                                        from students03@dscir
                                        where s_year = 2018 and dsc_pidm = dsu_pidm and s_entry_action in ('FF', 'FH'))
                                then 1
                            else 0
                        end;


-- Bachelor's Degree Information
update enroll.ipeds_npsas_sample_20
set has_bach_degree = case
                          when EXISTS(select 1
                                      from shrdgmr
                                      where shrdgmr_pidm = dsu_pidm
                                        and shrdgmr_degc_code like 'B%'
                                        and shrdgmr_degs_code = 'AW'
                                        and shrdgmr_grad_date < SYSDATE) then 1
                          else 0
                      end,
    bach_rec_month  = (select distinct to_char(shrdgmr_grad_date, 'MM')
                       from shrdgmr
                       where shrdgmr_pidm = dsu_pidm
                         and shrdgmr_degc_code like 'B%'
                         and shrdgmr_degs_code = 'AW'
                         and shrdgmr_grad_date < sysdate
                         and shrdgmr_grad_date = (select min(shrdgmr_grad_date)
                                                  from shrdgmr
                                                  where shrdgmr_pidm = dsu_pidm
                                                    and shrdgmr_degc_code like 'B%'
                                                    and shrdgmr_degs_code = 'AW'
                                                    and shrdgmr_grad_date < sysdate)),
    bach_rec_day    = (select distinct to_char(shrdgmr_grad_date, 'DD')
                       from shrdgmr
                       where shrdgmr_pidm = dsu_pidm
                         and shrdgmr_degc_code like 'B%'
                         and shrdgmr_degs_code = 'AW'
                         and shrdgmr_grad_date < sysdate
                         and shrdgmr_grad_date = (select min(shrdgmr_grad_date)
                                                  from shrdgmr
                                                  where shrdgmr_pidm = dsu_pidm
                                                    and shrdgmr_degc_code like 'B%'
                                                    and shrdgmr_degs_code = 'AW'
                                                    and shrdgmr_grad_date < sysdate)),
    bach_rec_year   = (select distinct to_char(shrdgmr_grad_date, 'YYYY')
                       from shrdgmr
                       where shrdgmr_pidm = dsu_pidm
                         and shrdgmr_degc_code like 'B%'
                         and shrdgmr_degs_code = 'AW'
                         and shrdgmr_grad_date < sysdate
                         and shrdgmr_grad_date = (select min(shrdgmr_grad_date)
                                                  from shrdgmr
                                                  where shrdgmr_pidm = dsu_pidm
                                                    and shrdgmr_degc_code like 'B%'
                                                    and shrdgmr_degs_code = 'AW'
                                                    and shrdgmr_grad_date < sysdate));

-- ACT Test Scores: ----------------------------------------------------------------------------------------
update enroll.ipeds_npsas_sample_20
set act_engl_score = ( -- ACT English
    select MAX(to_number(sortest_test_score))
    from sortest
    where sortest_pidm = dsu_pidm
      and sortest_tesc_code in ('A01', 'A07', 'NEW')
      and sortest_test_score between 0 and 36
      and (sortest_equiv_ind <> 'Y')
      and sortest_test_date = (select MAX(sortest_test_date)
                               from sortest
                               where sortest_pidm = dsu_pidm
                                 and sortest_tesc_code in ('A01', 'A07', 'NEW')
                                 and sortest_test_score between 0 and 36
                               group by sortest_pidm)
    group by dsu_pidm),
    act_math_score = ( -- ACT Math
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code in ('A02', 'A02N')
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code in ('A02', 'A02N')
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm),
    act_read_score = ( -- ACT Reading
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code in ('A03')
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code in ('A03')
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm),
    act_sci_score  = ( -- ACT Science
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code in ('A04')
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code in ('A04')
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm),
    act_comp_score = ( -- ACT Composite
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code in ('A05')
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code in ('A05')
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm);

-- SAT Test Scores:
update enroll.ipeds_npsas_sample_20
set sat_read_score  = ( -- SAT Reading
    select MAX(to_number(sortest_test_score))
    from sortest
    where sortest_pidm = dsu_pidm
      and sortest_tesc_code in ('S11')
      and sortest_test_date = (select MAX(sortest_test_date)
                               from sortest
                               where sortest_pidm = dsu_pidm
                                 and sortest_tesc_code in ('S11')
                               group by sortest_pidm)
    group by dsu_pidm),
    sat_math_score  = ( -- SAT Math
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code in ('S12', 'S12N')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code in ('S12', 'S12N')
                                   group by sortest_pidm)
        group by dsu_pidm),
    sat_essay_score = null;
--setting to null due to the essay not being required by admissions

-- Program
update enroll.ipeds_npsas_sample_20
set program_ay1920 = (select case substr(s1.cur_degc1, 1, 1)
                                 when 'B' then '4'
                                 when 'A' then '3'
                                 when 'C' then '2'
                                 else '1'
                             end
                      from students03@dscir s1
                      where s1.dsc_pidm = dsu_pidm
                        and s1.s_year = '2020'
                        and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                                from students03@dscir s2
                                                where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Graduate Degree
update enroll.ipeds_npsas_sample_20
set grad_degree_ay1920 = (select case
                                     when s1.cur_degc1 in ('MACC', 'MMFT') then '10'
                                     when s1.cur_degc1 = 'MA' then '2'
                                     else null
                                 end
                          from students03@dscir s1
                          where s1.dsc_pidm = dsu_pidm
                            and s1.s_year = '2020'
                            and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                                    from students03@dscir s2
                                                    where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Class Level
update enroll.ipeds_npsas_sample_20
set class_level_ay1920 = (select case s1.s_level
                                     when 'FR' then '1'
                                     when 'SO' then '2'
                                     when 'JR' then '3'
                                     when 'SR' then '4'
                                     else '5'
                                 end
                          from students03@dscir s1
                          where s1.dsc_pidm = dsu_pidm
                            and s1.s_year = '2020'
                            and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                                    from students03@dscir s2
                                                    where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Graduation Date (if graduated)
update enroll.ipeds_npsas_sample_20
set grad_month_ay1920 = (select to_char(shrdgmr_grad_date, 'MM')
                         from shrdgmr
                         where shrdgmr_pidm = dsu_pidm
                           and shrdgmr_degc_code not like 'C%'
                           and shrdgmr_degs_code in ('AW', 'PN')
                           and shrdgmr_acyr_code = '1920'),
    grad_day_ay1920   = (select to_char(shrdgmr_grad_date, 'DD')
                         from shrdgmr
                         where shrdgmr_pidm = dsu_pidm
                           and shrdgmr_degc_code not like 'C%'
                           and shrdgmr_degs_code in ('AW', 'PN')
                           and shrdgmr_acyr_code = '1920'),
    grad_year_ay1920  = (select to_char(shrdgmr_grad_date, 'YYYY')
                         from shrdgmr
                         where shrdgmr_pidm = dsu_pidm
                           and shrdgmr_degc_code not like 'C%'
                           and shrdgmr_degs_code in ('AW', 'PN')
                           and shrdgmr_acyr_code = '1920');

-- Cumulative GPA
update enroll.ipeds_npsas_sample_20
set cum_gpa_ay1920 = (select s1.s_cum_gpa_ugrad
                      from students03@dscir s1
                      where s1.dsc_pidm = dsu_pidm
                        and s1.s_year = '2020'
                        and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                                from students03@dscir s2
                                                where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Current Major 1
update enroll.ipeds_npsas_sample_20
set major1_ay1920 = (select stvmajr_desc
                     from students03@dscir s1,
                          stvmajr
                     where s1.cur_majr1 = stvmajr_code
                       and s1.dsc_pidm = dsu_pidm
                       and s1.s_year = '2020'
                       and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                               from students03@dscir s2
                                               where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Current Major CIP Code 1
update enroll.ipeds_npsas_sample_20
set cip1_ay1920 = (select s1.s_curr_cip
                   from students03@dscir s1
                   where s1.dsc_pidm = dsu_pidm
                     and s1.s_year = '2020'
                     and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                             from students03@dscir s2
                                             where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Current Major 2
update enroll.ipeds_npsas_sample_20
set major2_ay1920 = (select stvmajr_desc
                     from students03@dscir s1,
                          stvmajr
                     where s1.cur_majr2 = stvmajr_code
                       and s1.dsc_pidm = dsu_pidm
                       and s1.s_year = '2020'
                       and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                               from students03@dscir s2
                                               where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Current Major CIP Code 2
update enroll.ipeds_npsas_sample_20
set cip2_ay1920 = (select s1.s_curr_cip2
                   from students03@dscir s1
                   where s1.dsc_pidm = dsu_pidm
                     and s1.s_year = '2020'
                     and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                             from students03@dscir s2
                                             where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020')
                     and s1.s_curr_cip2 <> ' ');

-- Current Major CIP Code 2
update enroll.ipeds_npsas_sample_20
set cum_credits_ay1920 = (select s1.s_cum_hrs_ugrad
                          from students03@dscir s1
                          where s1.dsc_pidm = dsu_pidm
                            and s1.s_year = '2020'
                            and s1.dsc_term_code = (select MAX(s2.dsc_term_code)
                                                    from students03@dscir s2
                                                    where s2.dsc_pidm = dsu_pidm and s2.s_year = '2020'));

-- Charged Tuition Fees:
update enroll.ipeds_npsas_sample_20
set tuition_ay1920 = (select sum(tbraccd_amount)
                      from tbraccd
                      where tbraccd_pidm = dsu_pidm
                        and tbraccd_term_code in ('201930', '201940', '202020')
                        and tbraccd_detail_code < '2101');

-- Tuition Residency:
update enroll.ipeds_npsas_sample_20
set residency_ay1920 = case (select sgbstdn_resd_code
                             from sgbstdn
                             where sgbstdn_pidm = dsu_pidm
                               and sgbstdn_term_code_eff = (select MAX(sgbstdn_term_code_eff)
                                                            from sgbstdn
                                                            where sgbstdn_pidm = dsu_pidm
                                                              and sgbstdn_term_code_eff <=
                                                                  (select MAX(substr(dsc_term_code, 1, 5) || 0)
                                                                   from students03@dscir
                                                                   where dsc_pidm = dsu_pidm)))
                           when 'R' then 2
                           when 'C' then 2
                           when 'S' then 2
                           when 'A' then 2
                           when 'M' then 2
                           when 'G' then 3
                           when 'N' then 3
                           when '0' then 3
                       end;


-- Enrollments
update enroll.ipeds_npsas_sample_20
set enroll_summer_ptft_2019 = (select s_pt_ft
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20193E'),
    enroll_summer_hrs_2019  = (select s_term_att_cr
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20193E');

update enroll.ipeds_npsas_sample_20
set enroll_fall_ptft_2019 = (select s_pt_ft
                             from students03@dscir
                             where dsc_pidm = dsu_pidm and dsc_term_code = '20194E'),
    enroll_fall_hrs_2019  = (select s_term_att_cr
                             from students03@dscir
                             where dsc_pidm = dsu_pidm and dsc_term_code = '20194E');

update enroll.ipeds_npsas_sample_20
set enroll_spring_ptft_2020 = (select s_pt_ft
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20202E'),
    enroll_spring_hrs_2020  = (select s_term_att_cr
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20202E');

update enroll.ipeds_npsas_sample_20
set enroll_summer_ptft_2020 = (select s_pt_ft
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20202E'),
    enroll_spring_hrs_2020  = (select s_term_att_cr
                               from students03@dscir
                               where dsc_pidm = dsu_pidm and dsc_term_code = '20202E');

commit;

-- Update COVID-19 Metrics
-- Room & Board
-- Round dollar amounts to the nearest whole dollar
-- This information came fromt the housing department.  See https://drive.google.com/drive/u/2/folders/1vfQNBv5nvXa3azXGhubMya_CHVKczE42

update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 208 where ipeds_studentid = '00398881';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 523 where ipeds_studentid = '00394001';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 700 where ipeds_studentid = '00399950';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 275 where ipeds_studentid = '00394001';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 232 where ipeds_studentid = '00413111';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 523 where ipeds_studentid = '00404936';
update enroll.ipeds_npsas_sample_20 set rb_covid19_ay1920 = 450 where ipeds_studentid = '00400210';

commit;