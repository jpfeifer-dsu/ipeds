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
    tf_covid19_ay1920  number(10),    -- Tuition and Fees Refunded for COVID-19 ($) (2019-2020 academic year)
    rb_covid19_ay1920       number(10),    -- Room and board refunded for COVID-19 (2019-2020 academic year)
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
     inner join ipeds_npsas_sample_data_2020@dscir s2 on '00' || student_id = spriden_id -- imported table with sampled students
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

update enroll.ipeds_npsas_sample_20
set race_white    = -1,
    race_black    = -1,
    race_asian    = -1,
    race_indian= -1,
    race_hawaiian = -1
where race_white = 0
  and race_black = 0
  and race_asian = 0
  and race_indian = 0
  and race_hawaiian = 0;

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
set phone1_number = dsc.f_get_formatted_tele(dsu_pidm, 'LOCPERM', 'none');

update enroll.ipeds_npsas_sample_20
set phone1_type = '1'
where phone1_number is not null;

-- Student's Cell Phone Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone2_number = dsc.f_get_formatted_tele(dsu_pidm, 'CELLTELE', 'none');

update enroll.ipeds_npsas_sample_20
set phone2_type = '2'
where phone2_number is not null;

-- Student's Work Phone Area Code and Phone Number
update enroll.ipeds_npsas_sample_20
set phone1_number = dsc.f_get_formatted_tele(dsu_pidm, 'CAMPTELE', 'none');

update enroll.ipeds_npsas_sample_20
set phone1_type = '3'
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
update enroll.ipeds_npsas_sample_20 a
set last_enrl_month = (with cte_max_term_code as (select distinct
                                                         sfbetrm_pidm,
                                                         max(sfbetrm_term_code) as sfbetrm_term_code
                                                  from sfbetrm
                                                  group by sfbetrm_pidm)
                       select to_char(stvterm_end_date, 'MM')
                       from enroll.ipeds_npsas_sample_20 b,
                            cte_max_term_code,
                            stvterm,
                            spriden
                       where dsu_pidm = sfbetrm_pidm
                         and stvterm_code = sfbetrm_term_code
                         and spriden_pidm = sfbetrm_pidm
                         and spriden_change_ind is null
                         and a.dsu_pidm = b.dsu_pidm),


    last_enrl_day   = (with cte_max_term_code as (select distinct
                                                         sfbetrm_pidm,
                                                         max(sfbetrm_term_code) as sfbetrm_term_code
                                                  from sfbetrm
                                                  group by sfbetrm_pidm)
                       select to_char(stvterm_end_date, 'DD')
                       from enroll.ipeds_npsas_sample_20 b,
                            cte_max_term_code,
                            stvterm,
                            spriden
                       where dsu_pidm = sfbetrm_pidm
                         and stvterm_code = sfbetrm_term_code
                         and spriden_pidm = sfbetrm_pidm
                         and spriden_change_ind is null
                         and a.dsu_pidm = b.dsu_pidm),
    last_enrl_year  = (with cte_max_term_code as (select distinct
                                                         sfbetrm_pidm,
                                                         max(sfbetrm_term_code) as sfbetrm_term_code
                                                  from sfbetrm
                                                  group by sfbetrm_pidm)
                       select to_char(stvterm_end_date, 'YYYY')
                       from enroll.ipeds_npsas_sample_20 b,
                            cte_max_term_code,
                            stvterm,
                            spriden
                       where dsu_pidm = sfbetrm_pidm
                         and stvterm_code = sfbetrm_term_code
                         and spriden_pidm = sfbetrm_pidm
                         and spriden_change_ind is null
                         and a.dsu_pidm = b.dsu_pidm);

--degree_by_063020
update enroll.ipeds_npsas_sample_20 a
set degree_by_063020 = (select distinct 1
                        from enroll.ipeds_npsas_sample_20 b
                        left join shrdgmr dg on dg.shrdgmr_pidm = b.dsu_pidm
                         where a.dsu_pidm = b.dsu_pidm
                          and shrdgmr_grad_date <= to_date('6 June 2020', 'DD MON YYYY')
                          and shrdgmr_degs_code = 'AW');

update enroll.ipeds_npsas_sample_20
set degree_by_063020 = 0
where degree_by_063020 is null;


update enroll.ipeds_npsas_sample_20
set degree_by_063020 = 0
where degree_by_063020 is null;

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
                                               (subj_code = ('ENGL') and
                                                (crse_number like '0%' or crse_number = ('1470')
                                                     or (crse_number < '1000') or (subj_code = ('ESL'))))))
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
      and sortest_tesc_code = 'A01'
      and sortest_test_score between 0 and 36
      and (sortest_equiv_ind <> 'Y')
      and sortest_test_date = (select MAX(sortest_test_date)
                               from sortest
                               where sortest_pidm = dsu_pidm
                                 and sortest_tesc_code = 'A01'
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
          and sortest_tesc_code = 'A03'
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code = 'A03'
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm),
    act_sci_score  = ( -- ACT Science
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code = 'A04'
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code = 'A04'
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm),
    act_comp_score = ( -- ACT Composite
        select MAX(to_number(sortest_test_score))
        from sortest
        where sortest_pidm = dsu_pidm
          and sortest_tesc_code = 'A05'
          and sortest_test_score between 0 and 36
          and (sortest_equiv_ind <> 'Y')
          and sortest_test_date = (select MAX(sortest_test_date)
                                   from sortest
                                   where sortest_pidm = dsu_pidm
                                     and sortest_tesc_code = 'A05'
                                     and sortest_test_score between 0 and 36
                                   group by sortest_pidm)
        group by dsu_pidm);

-- SAT Test Scores:
update enroll.ipeds_npsas_sample_20
set sat_read_score  = ( -- SAT Reading
    select MAX(to_number(sortest_test_score))
    from sortest
    where sortest_pidm = dsu_pidm
      and sortest_tesc_code = 'S11'
      and sortest_test_date = (select MAX(sortest_test_date)
                               from sortest
                               where sortest_pidm = dsu_pidm
                                 and sortest_tesc_code = 'S11'
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


-- Program Credit Hours
update ipeds_npsas_sample_20 a
set hrs_credit_ay1920 = (select sum(hrs_this_yr)
                     from students03 b, dsc_programs_all c
                     where
                           b.cur_prgm1 = c.prgm_code
                           and c.acyr_code = '1920'
                           and a.dsu_pidm = b.dsc_pidm
                       and b.dsc_term_code = (select MAX(s2.dsc_term_code)
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
                           and shrdgmr_levl_code in ('GR')
                           and shrdgmr_acyr_code in ('2019', '2020')),
    grad_day_ay1920   = (select to_char(shrdgmr_grad_date, 'DD')
                         from shrdgmr
                         where shrdgmr_pidm = dsu_pidm
                           and shrdgmr_degc_code not like 'C%'
                           and shrdgmr_degs_code in ('AW', 'PN')
                           and shrdgmr_levl_code in ('GR')
                           and shrdgmr_acyr_code in ('2019', '2020')),
    grad_year_ay1920  = (select to_char(shrdgmr_grad_date, 'YYYY')
                         from shrdgmr
                         where shrdgmr_pidm = dsu_pidm
                           and shrdgmr_degc_code not like 'C%'
                           and shrdgmr_degs_code in ('AW', 'PN')
                           and shrdgmr_levl_code in ('GR')
                           and shrdgmr_acyr_code in ('2019', '2020'));

-- Cumulative GPA
update enroll.ipeds_npsas_sample_20 a
set cum_gpa_ay1920 = (select f_split_fields(f_concat_as_of_cum_gpa(dsu_pidm,'202040','UG','I'),5)
                      from ipeds_npsas_sample_20 b
                      where a.dsu_pidm = b.dsu_pidm);

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
update enroll.ipeds_npsas_sample_20 a
set cum_credits_ay1920 = (select f_split_fields(f_concat_as_of_cum_gpa(dsu_pidm,'202040','UG','I',NULL),1)
                          from ipeds_npsas_sample_20 b
                          where a.dsu_pidm = b.dsu_pidm);


-- Charged Tuition Fees:
update enroll.ipeds_npsas_sample_20
set tuition_ay1920 = (select sum(tbraccd_amount)
                      from tbraccd
                      where tbraccd_pidm = dsu_pidm
                        and tbraccd_term_code in ('201930', '201940', '202020')
                        and tbraccd_detail_code in
                            ('1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009', '1010', '1011', '1012', '1013', '1014', '1015', '1016',
                            '1103', '1104', '1200', '1201', '1250', '1255', '1256', '1257', '1260', '1261', '1262', '1263', '1264', '1265', '1266', '1300',
                            '1301', '1302', '1400', '1401', '1402', '1403', '1404', '1410', '1411', '1412', '1413', '1414', '1415', '1416', '1417', '1450',
                            '1451', '1452', '1453', '1460', '1461', '1462', '1503', '1505', '1601', '1602', '1603', '1605', '1620', '1621', '1622', '1623',
                            '1624', '1625', '1626', '1627', '1630', '1631', '1632', '1633', '1634', '1635', '1636', '1637', '1638', '1700', '1701', '1702',
                            '1703', '1710', '1711', '1720', '1721', '1722', '1800', '1801', '1900', '2100', '2225', '2301', '2302', '2303', '2304', '2305',
                            '2306', '2307', '2308', '2309', '2310', '2311', '2313', '2314', '2315', '2316', '2317', '2318', '2319', '2320', '2321', '2322',
                            '2323', '2324', '2325', '2326', '2327', '2328', '2329', '2330', '2331', '2332', '2333', '2334', '2335', '2336', '2337', '2338',
                            '2339', '2340', '2341', '2342', '2343', '2344', '2345', '2346', '2347', '2348', '2349', '2350', '2351', '2352', '2353', '2354',
                            '2355', '2356', '2357', '2358', '2359', '2360', '2361', '2362', '2363', '2364', '2365', '2366', '2380', '2385', '2386', '2387',
                            '2388', '2389', '2390', '2391', '2392', '2393', '2394', '2395', '2400', '2401', '2402', '2403', '2405', '2406', '2410', '2411',
                            '2415', '2417', '2418', '2419', '2420', '2421', '2422', '2423', '2425', '2426', '2430', '2435', '2440', '2441', '2442', '2443',
                            '2460', '2461', '2510', '2511', '2512', '2514', '2515', '2517', '2520', '2521', '2522', '2523', '2524', '2525', '2527', '2551',
                            '2552', '2553', '2554', '2555', '2556', '2557', '2558', '2559', '2560', '2561', '2562', '2563', '2564', '2565', '2566', '2567',
                            '2568', '2569', '2600', '2601', '2602', '2603', '2605', '2606', '2607', '2608', '2609', '2610', '2611', '2612', '2613', '2614',
                            '2615', '2616', '2617', '2618', '2619', '2620', '2621', '2622', '2623', '2625', '2626', '2627', '2629', '2630', '2632', '2633',
                            '2634', '2635', '2636', '2637', '2638', '2641', '2645', '2647', '2648', '2650', '2651', '2653', '2654', '2655', '2656', '2657',
                            '2700', '2702', '2800', '2801', '2802', '2803', '2804', '2805', '2806', '2807', '2808', '2809', '2810', '2811', '2812', '2813',
                            '2814', '2815', '2816', '2817', '2818', '2819', '2820', '2821', '2900', '2950', '3036', '3037', '3038', '3039', '3041', '3044',
                            '3045', '3081', '3083', '3344')
    );

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
                           when 'A' then 3
                           when 'M' then 3
                           when 'G' then 3
                           when 'N' then 4
                           when '0' then 4
                           when 'S' then 4
                       end;

-- Enrollments
update enroll.ipeds_npsas_sample_20 a
set enroll_summer_ptft_2019 = (select case
                                          when SUM(sfrstcr_credit_hr) >= 12 then 1 -- Full-time
                                          when SUM(sfrstcr_credit_hr) between 9 and 11.99 then 2 -- 3/4-time
                                          when SUM(sfrstcr_credit_hr) between 6 and 8.99 then 3 -- half-time
                                          when SUM(sfrstcr_credit_hr) < 6 then 4 -- lass than half-time
                                      end as enroll_spring_ptft_2020
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '201930' --Spring 2020  202030 Summer 2020
                               group by sfrstcr_pidm, sfrstcr_term_code),
    enroll_summer_hrs_2019  = (select sum(r1.sfrstcr_credit_hr)
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '201930'
                               group by sfrstcr_pidm, sfrstcr_term_code);

update enroll.ipeds_npsas_sample_20 a
set enroll_fall_ptft_2019 = (select case
                                          when SUM(sfrstcr_credit_hr) >= 12 then 1 -- Full-time
                                          when SUM(sfrstcr_credit_hr) between 9 and 11.99 then 2 -- 3/4-time
                                          when SUM(sfrstcr_credit_hr) between 6 and 8.99 then 3 -- half-time
                                          when SUM(sfrstcr_credit_hr) < 6 then 4 -- lass than half-time
                                      end as enroll_spring_ptft_2020
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '201940' --Spring 2020  202030 Summer 2020
                               group by sfrstcr_pidm, sfrstcr_term_code),
    enroll_fall_hrs_2019  = (select sum(r1.sfrstcr_credit_hr)
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '201940'
                               group by sfrstcr_pidm, sfrstcr_term_code);

update enroll.ipeds_npsas_sample_20 a
set enroll_spring_ptft_2020 = (select case
                                          when SUM(sfrstcr_credit_hr) >= 12 then 1 -- Full-time
                                          when SUM(sfrstcr_credit_hr) between 9 and 11.99 then 2 -- 3/4-time
                                          when SUM(sfrstcr_credit_hr) between 6 and 8.99 then 3 -- half-time
                                          when SUM(sfrstcr_credit_hr) < 6 then 4 -- lass than half-time
                                      end as enroll_spring_ptft_2020
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '202020' --Spring 2020  202030 Summer 2020
                               group by sfrstcr_pidm, sfrstcr_term_code),
    enroll_spring_hrs_2020  = (select sum(r1.sfrstcr_credit_hr)
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '202020'
                               group by sfrstcr_pidm, sfrstcr_term_code);



update enroll.ipeds_npsas_sample_20 a
set enroll_summer_ptft_2020 = (select case
                                          when SUM(sfrstcr_credit_hr) >= 12 then 1 -- Full-time
                                          when SUM(sfrstcr_credit_hr) between 9 and 11.99 then 2 -- 3/4-time
                                          when SUM(sfrstcr_credit_hr) between 6 and 8.99 then 3 -- half-time
                                          when SUM(sfrstcr_credit_hr) < 6 then 4 -- lass than half-time
                                      end as enroll_spring_ptft_2020
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '202030'
                               group by sfrstcr_pidm, sfrstcr_term_code),
    enroll_summer_hrs_2020  = (select sum(r1.sfrstcr_credit_hr)
                               from ipeds_npsas_sample_20 b
                               left join sfrstcr r1 on b.dsu_pidm = r1.sfrstcr_pidm
                               left join stvrsts r2 on r1.sfrstcr_rsts_code = r2.stvrsts_code
                               where a.dsu_pidm = b.dsu_pidm
                                 and r2.stvrsts_incl_sect_enrl = 'Y'
                                 and sfrstcr_term_code = '202030'
                               group by sfrstcr_pidm, sfrstcr_term_code);

update enroll.ipeds_npsas_sample_20
set enroll_summer_ptft_2019 = 0
where enroll_summer_ptft_2019 is null;

update enroll.ipeds_npsas_sample_20
set enroll_summer_hrs_2019 = 0
where enroll_summer_hrs_2019 is null;

update enroll.ipeds_npsas_sample_20
set enroll_fall_ptft_2019= 0
where enroll_fall_ptft_2019 is null;

update enroll.ipeds_npsas_sample_20
set enroll_fall_hrs_2019 = 0
where enroll_fall_hrs_2019 is null;

update enroll.ipeds_npsas_sample_20
set enroll_spring_ptft_2020 = 0
where enroll_spring_ptft_2020 is null;

update enroll.ipeds_npsas_sample_20
set enroll_spring_hrs_2020 = 0
where enroll_spring_hrs_2020 is null;

update enroll.ipeds_npsas_sample_20
set enroll_summer_ptft_2020 = 0
where enroll_summer_ptft_2020 is null;

update enroll.ipeds_npsas_sample_20
set enroll_summer_hrs_2020 = 0
where enroll_summer_hrs_2020 is null;

commit;

-- Update COVID-19 Metrics
-- Room & Board
-- Round dollar amounts to the nearest whole dollar
-- File Name: COVID 19 Housing Reimbursement Report.xlsx
-- Location: G:\Shared drives\Institutional Effectiveness\IPEDS\ipeds-npsas\npsas-2020\additional docs

update enroll.ipeds_npsas_sample_20
set rb_covid19_ay1920 = 1
where ipeds_studentid in ('00398881','00394001','00399950','00394001','00413111','00404936', '00400210');

update enroll.ipeds_npsas_sample_20
set rb_covid19_ay1920 = 0
where rb_covid19_ay1920 is null;

-- Update COVID-19 Tuition and Fee Refunds
-- Gathered Refund for Fees from Campus
-- File Name: CoVID 19 Fee Refunds for NPSAS.xlsx
-- Location: G:\Shared drives\Institutional Effectiveness\IPEDS\ipeds-npsas\npsas-2020\additional docs

update enroll.ipeds_npsas_sample_20
set tf_covid19_ay1920 = 1925
where ipeds_studentid = '00405295';

commit;

select *
from enroll.ipeds_npsas_sample_20;