 ------------------------------------------------------------------------------------------------------------
 /*
    2020 National Postsecondary Student Aid Study - Student Enrollment List

    A sample of students will be randomly selected from the list of enrolled students that you
    provide, and will be combined with samples selected from other institutions to form a nationally
    representative sample of postsecondary students. To ensure a scientifically valid sample, it is
    extremely important that you follow the instructions provided in this document when preparing
    your institution’s list. We realize that postsecondary institutions vary widely in their
    organizational structures, and that some of the criteria presented below may not apply to your
    institution.
 */
 ------------------------------------------------------------------------------------------------------------

 DROP   TABLE enroll.ipeds_npsas_20;
 CREATE TABLE enroll.ipeds_npsas_20
 (
   -- General -----------------------------------------------------------------------------------------------------------------
   dsu_pidm             VARCHAR2(9),
   ipeds_unit_id        VARCHAR2(6),  --IPEDS Unit ID
   student_id           VARCHAR2(25),  --Student ID
   first_name           VARCHAR2(100), -- First Name
   middle_name          VARCHAR2(50),  -- Middle Name
   last_name            VARCHAR2(100), -- Last Name
   name_suffix          VARCHAR2(50),  -- Suffix
   ssn                  VARCHAR2(9),   -- SSN
   dob_month            VARCHAR2(2),   -- DOB Month
   dob_day              VARCHAR2(2),   -- DOB Day
   dob_year             VARCHAR2(4),   -- DOB Year
   gender               VARCHAR2(2),   -- Sex
   veteran_status       VARCHAR2(2),   -- Veteran Status
   dual_enrollment      VARCHAR2(2),   -- High School Completion Type
   hs_completion_month  VARCHAR(2),    -- High School Completion Month
   hs_completion_day    VARCHAR(2),    -- High School Completion Day
   hs_completion_year   VARCHAR2(4),   -- High School Completion Year
   ethnicity            VARCHAR2(2),   -- Ethnicity
   race_white           VARCHAR2(2),   -- Race: White
   race_black           VARCHAR2(2),   -- Race: Black or African American
   race_asian           VARCHAR2(2),   -- Race: Asian
   race_indian          VARCHAR2(2),   -- Race: American Indian or Alaska Native
   race_hawaiian        VARCHAR2(2),   -- Race: Native Hawaiian or addtl Pacific Islander
   perm_add_line1       VARCHAR2(100), -- Permanent Address Line 1
   perm_add_line2       VARCHAR2(100), -- Permanent Address Line 2
   perm_add_city        VARCHAR2(100), -- Permanent Address City
   perm_add_state       VARCHAR2(2),   -- Permanent Address State
   perm_add_country     VARCHAR2(50),  -- Permanent Address Country (if not USA)
   perm_add_zip         VARCHAR2(25),  -- Permanent Address Zip
   local_add_line1      VARCHAR2(100), -- Local/Most Recent Address Line 1
   local_add_line2      VARCHAR2(100), -- Local/Most Recent Address Line 2
   local_add_city       VARCHAR2(100), -- Local/Most Recent Address City
   local_add_state      VARCHAR2(2),   -- Local/Most Recent Address State
   local_add_zip        VARCHAR2(9),   -- Local/Most Recent Address Zip
   phone1_number        VARCHAR2(10),  -- Phone 1 Number
   phone1_type          VARCHAR2(2),   -- Phone 1 Type
   phone2_number        VARCHAR2(10),  -- Phone 2 Number
   phone2_type          VARCHAR2(2),   -- Phone 2 Type
   email_campus         VARCHAR2(100), -- Campus Email
   email_permanent      VARCHAR2(100), -- Permanent Email
   -- Enrollment --------------------------------------------------------------------------------------------------------------
   first_enrl_month     VARCHAR2(2),   -- Date First Enrolled at this Institution (Month)
   first_enrl_day       VARCHAR2(2),   -- Date First Enrolled at this Institution (Day)
   first_enrl_year      VARCHAR2(4),   -- Date First Enrolled at this Institution (Year)
   first_time_student   VARCHAR2(1),   -- First-time Beginning Student
   program_ay1920       VARCHAR2(2),   -- Program/Degree (2019-2020 academic year)
   class_level_ay1920   VARCHAR2(2),   -- Class Level (2019-2020 academic year)
   major1_ay1920        VARCHAR2(30),  -- First Major (2019-2020 academic year)
   cip1_ay1920          VARCHAR2(6),   -- First Major CIP Code (NNNNNN) (2019-2020 academic year)
   major2_ay1920        VARCHAR2(30),  -- Second Major (2019-2020 academic year)
   cip2_ay1920          VARCHAR2(6)    -- Second Major CIP Code (NNNNNN) (2019-2020 academic year)
 );

 ------------------------------------------------------------------------------------------------------------
 -- Add Students

INSERT INTO enroll.ipeds_npsas_20
  (
    dsu_pidm,
    ipeds_unit_id,
    student_id,
    first_name,
    middle_name,
    last_name,
    name_suffix,
    ssn,
    dob_month,
    dob_day,
    dob_year,
    gender,
    veteran_status,
    dual_enrollment,
    hs_completion_month,
    hs_completion_day,
    hs_completion_year,
    ethnicity,
    race_white,
    race_black,
    race_asian,
    race_indian,
    race_hawaiian,
    perm_add_line1,
    perm_add_line2,
    perm_add_city,
    perm_add_state,
    perm_add_country,
    perm_add_zip,
    local_add_line1,
    local_add_line2,
    local_add_city,
    local_add_state,
    local_add_zip,
    phone1_number,
    phone1_type,
    phone2_number,
    phone2_type,
    email_campus,
    email_permanent,
    first_enrl_month,
    first_enrl_day,
    first_enrl_year,
    first_time_student,
    program_ay1920,
    class_level_ay1920,
    major1_ay1920,
    cip1_ay1920,
    major2_ay1920,
    cip2_ay1920
  )
SELECT
    dsc_pidm,
    '230171' as ipeds_unit_id,
    spriden_id as student_id,
    s_first as first_name,
    nvl(s_middle,' ') as middle_name,
    s_last as last_name,
    nvl(s_suffix,' ') as name_suffix,
    spbpers_ssn as ssn,
    substr(s_birth_dt,5,2) AS dob_month,
    substr(s_birth_dt,7,2) AS dob_day,
    substr(s_birth_dt,1,4) AS dob_year,
    CASE s_gender WHEN 'M' THEN 0 ELSE 1 END AS gender,
    null as veteran_status,
    CASE WHEN s_entry_action = 'HS' then 1
    else 0 END AS dual_enrollment,
    substr(dsc_hsgrad_dt, 5,2) as hs_completion_month,
    substr(dsc_hsgrad_dt, 7,2) as hs_completion_month,
    substr(dsc_hsgrad_dt,1,4) AS hs_completion_year,
    s_ethnic as ethnicity,
    --THESE ARE BACK FILLED WITH AN UPDATE STATEMENT
    -1 as race_white,
    -1 as race_black,
    -1 as race_asian,
    -1 as race_indian,
    -1 as race_hawaiian,
    null as perm_add_line1,
    null as perm_add_line2,
    null as perm_add_city,
    null as perm_add_state,
    null as perm_add_country,
    null as perm_add_zip,
    null as local_add_line1,
    null as local_add_line2,
    null as local_add_city,
    null as local_add_state,
    null as local_add_zip,
    null as phone1_number,
    null as phone1_type,
    null as phone2_number,
    null as phone2_type,
    null as email_campus,
    null as email_permanent,
    null as first_enrl_month,
    null as first_enrl_day,
    null as first_enrl_year,
       0 as first_time_student,
    null as program_ay1920,
      -1 as class_level_ay1920,
    null as major1_ay1920,
    null as cip1_ay1920,
    null as major2_ay1920,
    null as cip2_ay1920
    FROM   students03@dscir s1, spbpers, spriden
    WHERE  dsc_pidm = spbpers_pidm
    AND    s1.dsc_pidm = spriden_pidm
    AND    s1.dsc_term_code IN ('20193E','20194E','202023')
    AND    spriden_change_ind IS NULL
    AND   (spbpers_confid_ind IS NULL OR spbpers_confid_ind <> 'Y')
    -- Checking for Students that solely took remedial courses
    AND s1.dsc_pidm NOT IN (
        SELECT DSC_PIDM
        FROM student_courses@dscir
        WHERE
        dsc_term_code IN ('20193E','20194E','202023')
        AND sc_crs_num < '1000'
        AND dsc_pidm NOT IN (
            SELECT dsc_pidm
            FROM student_courses@dscir
            WHERE sc_crs_num >= '1000'
        ))
    AND    s1.dsc_term_code =
     (
       SELECT max(dsc_term_code)
       FROM   students03@dscir s2
       WHERE  s2.dsc_pidm = s1.dsc_pidm
       AND    s2.dsc_term_code IN ('20193E','20194E','202023')
     );

 ------------------------------------------------------------------------------------------------------------

 -- Veteran Status
    UPDATE enroll.ipeds_npsas_20
    SET    veteran_status =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   sgrvetn
             WHERE  sgrvetn_pidm = dsu_pidm
           ) THEN 1 ELSE 0 END;

 -- Ethnicities

    UPDATE enroll.ipeds_npsas_20 SET race_white    = CASE WHEN ethnicity = 'W' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_20 SET race_black    = CASE WHEN ethnicity = 'B' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_20 SET race_asian    = CASE WHEN ethnicity = 'A' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_20 SET race_indian   = CASE WHEN ethnicity = 'I' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_20 SET race_hawaiian = CASE WHEN ethnicity = 'P' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_20 SET ethnicity     = CASE WHEN ethnicity = 'H' THEN 1
                                                          WHEN ethnicity = 'U' THEN -1
                                                                               ELSE  0 END;

 -- Permanent Address
    UPDATE enroll.ipeds_npsas_20
    SET    perm_add_line1 =
           (
             SELECT s1.spraddr_street_line1
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           ),
           perm_add_line2 =
           (
             SELECT s1.spraddr_street_line2
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           ),
           perm_add_city =
           (
             SELECT s1.spraddr_city
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           ),
           perm_add_state =
           (
             SELECT s1.spraddr_stat_code
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           ),
           perm_add_country =
           (
             SELECT s1.spraddr_natn_code
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           ),
           perm_add_zip =
           (
             SELECT regexp_replace(substr(s1.spraddr_zip,0,9), '[^0-9]', '')
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = '00'
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = s1.spraddr_pidm
                      AND    s2.spraddr_atyp_code = '00'
                    )
           );

 -- Student's Local Address, City, State and Zip Code
    UPDATE enroll.ipeds_npsas_20
    SET    local_add_line1 =
           (
             SELECT s1.spraddr_street_line1
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = dsu_pidm
                      AND    s2.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
                    )
           ),
           local_add_line2 =
           (
             SELECT s1.spraddr_street_line2
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = dsu_pidm
                      AND    s2.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
                    )
           ),
           local_add_city =
           (
             SELECT s1.spraddr_city
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = dsu_pidm
                      AND    s2.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
                    )
           ),
           local_add_state =
           (
             SELECT s1.spraddr_stat_code
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = dsu_pidm
                      AND    s2.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
                    )
           ),
           local_add_zip =
           (
             SELECT substr(s1.spraddr_zip,0,5)
             FROM   spraddr s1
             WHERE  s1.spraddr_pidm = dsu_pidm
             AND    s1.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
             AND    REGEXP_LIKE (substr(trim(s1.spraddr_zip),0,5),'^[[:digit:]]+$')
             AND    s1.spraddr_seqno =
                    (
                      SELECT MAX(s2.spraddr_seqno)
                      FROM   spraddr s2
                      WHERE  s2.spraddr_pidm = dsu_pidm
                      AND    s2.spraddr_atyp_code = enroll.f_get_local_atyp(dsu_pidm)
                    )
           );

 -- Students Local Permanent Phone Number
    UPDATE enroll.ipeds_npsas_20
    SET phone1_number = dsc.f_get_formatted_tele(dsu_pidm,'LOCPERM', 'none')
    WHERE LENGTH(dsc.f_get_formatted_tele(dsu_pidm,'LOCPERM', 'none')) <= 10;

    UPDATE enroll.ipeds_npsas_20
    SET    phone1_type = '1'
    WHERE  phone1_number IS NOT NULL;

 -- Student's Cell Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_20
    SET phone2_number = dsc.f_get_formatted_tele(dsu_pidm,'CELLTELE', 'none')
    WHERE LENGTH(dsc.f_get_formatted_tele(dsu_pidm,'CELLTELE', 'none')) <= 10;

    UPDATE enroll.ipeds_npsas_20
    SET    phone2_type = '2'
    WHERE  phone2_number IS NOT NULL;

 -- Student's Work Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_20
    SET    phone1_number =
           (
             SELECT substr(s1.sprtele_phone_area||s1.sprtele_phone_number,1,10)
             FROM   sprtele s1
             WHERE  s1.sprtele_pidm = dsu_pidm
             AND    s1.sprtele_tele_code = 'WK'
             AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
             AND    LENGTH(s1.sprtele_phone_area) = '3'
             AND    s1.sprtele_seqno =
                    (

                      SELECT MAX(s2.sprtele_seqno)
                      FROM   sprtele s2
                      WHERE  s2.sprtele_pidm = s1.sprtele_pidm
                      AND    s2.sprtele_tele_code = 'WK'
                      AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
                      AND    LENGTH(s1.sprtele_phone_area) = '3'
                    )
           )
    WHERE  phone1_number IS NULL;

    UPDATE enroll.ipeds_npsas_20
    SET    phone1_type = '3'
    WHERE  phone1_number IS NOT NULL
    AND    phone1_type IS NULL;

 -- Student's Other Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_20
    SET    phone1_number =
           (
             SELECT substr(s1.sprtele_phone_area||s1.sprtele_phone_number,1,10)
             FROM   sprtele s1
             WHERE  s1.sprtele_pidm = dsu_pidm
             AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
             AND    LENGTH(s1.sprtele_phone_area) = '3'
             AND    s1.sprtele_seqno =
                    (
                      SELECT MAX(s2.sprtele_seqno)
                      FROM   sprtele s2
                      WHERE  s2.sprtele_pidm = s1.sprtele_pidm
                      AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
                      AND    LENGTH(s1.sprtele_phone_area) = '3'
                    )
           )
    WHERE  phone1_number IS NULL;

    UPDATE enroll.ipeds_npsas_20
    SET    phone1_type = '3'
    WHERE  phone1_number IS NOT NULL
    AND    phone1_type IS NULL;

 -- Student's Campus Email Address
    UPDATE enroll.ipeds_npsas_20
    SET    email_campus =
           (
             SELECT goremal_email_address
             FROM   goremal
             WHERE  ROWID = dsc.f_get_email_rowid(dsu_pidm,'STU_EMAIL','A',1)
           );

 -- Student's Permanent Email Address
    UPDATE enroll.ipeds_npsas_20
    SET    email_permanent =
           (
             SELECT goremal_email_address
             FROM   goremal
             WHERE  ROWID = dsc.f_get_email_rowid(dsu_pidm,'P_EMAIL','A',1)
           );

 -- Date of First Enrollment
    UPDATE enroll.ipeds_npsas_20
    SET    first_enrl_month = nvl(
           (
             SELECT to_char(stvterm_start_date,'MM')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    s_entry_action IN ('FF','FH','TU')
             AND    s_term||s_extract IN ('1E','23','33')
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action IN ('FF','FH','TU')
                    )
           ),
           (
             SELECT to_char(stvterm_start_date,'MM')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    s_entry_action <> 'HS'
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action <> 'HS'
                    )
           )),
           first_enrl_day = nvl(
           (
             SELECT to_char(stvterm_start_date,'DD')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    s_entry_action IN ('FF','FH','TU')
             AND    s_term||s_extract IN ('1E','23','33')
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action IN ('FF','FH','TU')
                    )
           ),(
             SELECT to_char(stvterm_start_date,'DD')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    s_entry_action <> 'HS'
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action <> 'HS'
                    )
           )),
           first_enrl_year = nvl(
           (
             SELECT to_char(stvterm_start_date,'YYYY')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    s_entry_action IN ('FF','FH','TU')
             AND    s_term||s_extract IN ('1E','23','33')
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action IN ('FF','FH','TU')
                    )
           ),
           (
             SELECT to_char(stvterm_start_date,'YYYY')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    s_entry_action <> 'HS'
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                      AND    s_entry_action <> 'HS'
                    )
           ));

 -- Date of First Enrollment
    UPDATE enroll.ipeds_npsas_20
    SET    first_enrl_month =
           (
             SELECT to_char(stvterm_start_date,'MM')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           ),
           first_enrl_day =
           (
             SELECT to_char(stvterm_start_date,'DD')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           ),
           first_enrl_year =
           (
             SELECT to_char(stvterm_start_date,'YYYY')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MIN(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           )
    WHERE  first_enrl_month IS NULL
    OR     first_enrl_day   IS NULL
    OR     first_enrl_year  IS NULL;

 -- Fist-time Beginning Student
    UPDATE enroll.ipeds_npsas_20
    SET    first_time_student =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   students03@dscir
             WHERE  s_year = 2020
             AND    dsc_pidm = dsu_pidm
             AND    s_entry_action IN ('FF','FH')
           )
           THEN 1 ELSE 0 END;

 -- AY 2019-2020 --------------------------------------------------------------------------------------------

 -- Program
    UPDATE enroll.ipeds_npsas_20
    SET    program_ay1920 =
           (
             SELECT CASE substr(s1.cur_degc1,1,1)
                         WHEN 'B' THEN '4'
                         WHEN 'A' THEN '3'
                         WHEN 'C' THEN '2'
                         ELSE          '1' END
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
           );

 -- Class Level
    UPDATE enroll.ipeds_npsas_20
    SET    class_level_ay1920 =
           (
             SELECT CASE s1.s_level
                         WHEN 'FR' THEN '1'
                         WHEN 'SO' THEN '2'
                         WHEN 'JR' THEN '3'
                         WHEN 'SR' THEN '4'
                         ELSE           '5' END
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
           );

 -- Current Major 1
    UPDATE enroll.ipeds_npsas_20
    SET    major1_ay1920 =
           (
             SELECT stvmajr_desc
             FROM   students03@dscir s1, stvmajr
             WHERE  s1.cur_majr1 = stvmajr_code
             AND    s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
           );

 -- Current Major CIP Code 1
    UPDATE enroll.ipeds_npsas_20
    SET    cip1_ay1920 =
           (
             SELECT s1.s_curr_cip
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
           );

 -- Current Major 2
    UPDATE enroll.ipeds_npsas_20
    SET    major2_ay1920 =
           (
             SELECT stvmajr_desc
             FROM   students03@dscir s1, stvmajr
             WHERE  s1.cur_majr2 = stvmajr_code
             AND    s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
           );

 -- Current Major CIP Code 2
    UPDATE enroll.ipeds_npsas_20
    SET    cip2_ay1920 =
           (
             SELECT s1.s_curr_cip2
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2020'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2020'
                    )
             AND    s1.s_curr_cip2 <> ' '
           );

    COMMIT;
 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------

 -- Query for NPSAS Submission
    SELECT ipeds_unit_id,
    student_id,
    first_name,
    middle_name,
    last_name,
    name_suffix,
    ssn,
    dob_month,
    dob_day,
    dob_year,
    gender,
    veteran_status,
    dual_enrollment,
    hs_completion_month,
    hs_completion_day,
    hs_completion_year,
    ethnicity,
    race_white,
    race_black,
    race_asian,
    race_indian,
    race_hawaiian,
    perm_add_line1,
    perm_add_line2,
    perm_add_city,
    perm_add_state,
    perm_add_country,
    perm_add_zip,
    local_add_line1,
    local_add_line2,
    local_add_city,
    local_add_state,
    local_add_zip,
    phone1_number,
    phone1_type,
    phone2_number,
    phone2_type,
    email_campus,
    email_permanent,
    first_enrl_month,
    first_enrl_day,
    first_enrl_year,
    first_time_student,
    program_ay1920,
    class_level_ay1920,
    major1_ay1920,
    cip1_ay1920,
    major2_ay1920,
    cip2_ay1920
    FROM enroll.ipeds_npsas_20;

    --Excluded Counts
    --Run to see number of FERPA and Solely Remedial exclusions. Open DMBS Output under view to see results.
    DECLARE
        ferp_cnt NUMBER (3);
        remedial_cnt NUMBER(3);
    BEGIN
        --FERPA
        SELECT COUNT(*) ferp_cnt INTO ferp_cnt
        FROM   students03@dscir s1, spbpers, spriden
        WHERE  dsc_pidm = spbpers_pidm
            AND    s1.dsc_pidm = spriden_pidm
            AND    s1.dsc_term_code IN ('20193E','20194E','202023')
            AND    spriden_change_ind IS NULL
            AND   spbpers_confid_ind = 'Y'
            AND    s1.dsc_term_code =
             (
               SELECT max(dsc_term_code)
               FROM   students03@dscir s2
               WHERE  s2.dsc_pidm = s1.dsc_pidm
               AND    s2.dsc_term_code IN ('20193E','20194E','202023')
             );
        -- Solely Remedial
        SELECT COUNT(*) remedial_cnt INTO remedial_cnt
        FROM student_courses@dscir
        WHERE
        dsc_term_code IN ('20193E','20194E','202023')
        AND sc_crs_num < '1000'
        AND dsc_pidm NOT IN (
            SELECT dsc_pidm
            FROM student_courses@dscir
            WHERE sc_crs_num >= '1000');
        DBMS_OUTPUT.PUT_LINE ('Number of FERPA exclusions: ' || ferp_cnt);
        DBMS_OUTPUT.PUT_LINE ('Number of Solely Remedial exclusions: ' || remedial_cnt);
    END;
 --------------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------------


-- end of file