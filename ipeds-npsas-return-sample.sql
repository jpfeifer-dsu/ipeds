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

 DROP   TABLE enroll.ipeds_npsas_18;
 CREATE TABLE enroll.ipeds_npsas_18
 (
   -- General -----------------------------------------------------------------------------------------------------------------
   ipeds_fsvn         VARCHAR2(2),   -- File Specification Version Number
   ipeds_instid       VARCHAR2(6),   -- Institute ID
   ipeds_studyid      VARCHAR2(99),  -- Study ID
   dsu_term           VARCHAR2(6),   --
   dsu_pidm           VARCHAR2(9),   --
   dsu_hsgrad_dt      VARCHAR2(8),   --
   ipeds_studentid    VARCHAR2(8),   -- Student ID
   first_name         VARCHAR2(50),  -- First Name
   middle_name        VARCHAR2(50),  -- Middle Name
   last_name          VARCHAR2(50),  -- Last Name
   suffix             VARCHAR2(10),  -- Suffix
   ssn                VARCHAR2(9),   -- SSN
   dob_month          VARCHAR2(2),   -- DOB Month
   dob_day            VARCHAR2(2),   -- DOB Day
   dob_year           VARCHAR2(4),   -- DOB Year
   gender             VARCHAR2(2),   -- Sex
   npsas_eligible     VARCHAR2(2),   -- Student is eligible for NPSAS:18-AC?
   ineligible_reason  VARCHAR2(2),   -- Ineligible Reason
   marital_status     VARCHAR2(2),   -- Marital Status
   maiden_name        VARCHAR2(50),  -- Maiden Name
   spouse_first_name  VARCHAR2(50),  -- Spouse First Name
   spouse_middle_name VARCHAR2(50),  -- Spouse Middle Name
   spouse_last_name   VARCHAR2(50),  -- Spouse Last Name
   citizenship_status VARCHAR2(2),   -- Citizenship Status
   veteran_status     VARCHAR2(2),   -- Veteran Status
   hs_completion_type VARCHAR2(2),   -- High School Completion Type
   hs_completion_year VARCHAR2(4),   -- High School Completion Year
   ethnicity          VARCHAR2(2),   -- Ethnicity
   race_white         VARCHAR2(2),   -- Race: White
   race_black         VARCHAR2(2),   -- Race: Black or African American
   race_asian         VARCHAR2(2),   -- Race: Asian
   race_indian        VARCHAR2(2),   -- Race: American Indian or Alaska Native
   race_hawaiian      VARCHAR2(2),   -- Race: Native Hawaiian or addtl Pacific Islander
   perm_add_line1     VARCHAR2(100), -- Permanent Address Line 1
   perm_add_line2     VARCHAR2(50),  -- Permanent Address Line 2
   perm_add_city      VARCHAR2(50),  -- Permanent Address City
   perm_add_state     VARCHAR2(2),   -- Permanent Address State
   perm_add_zip       VARCHAR2(9),   -- Permanent Address Zip
   perm_add_country   VARCHAR2(50),  -- Permanent Address Country (if not USA)
   is_perm_resd       VARCHAR2(2),   -- Is the student a permanent resident of the state in which your institution is located?
   local_add_line1    VARCHAR2(100), -- Local/Most Recent Address Line 1
   local_add_line2    VARCHAR2(50),  -- Local/Most Recent Address Line 2
   local_add_city     VARCHAR2(50),  -- Local/Most Recent Address City
   local_add_state    VARCHAR2(2),   -- Local/Most Recent Address State
   local_add_zip      VARCHAR2(9),   -- Local/Most Recent Address Zip
   phone1_number      VARCHAR2(10),  -- Phone 1 Number
   phone1_type        VARCHAR2(2),   -- Phone 1 Type
   phone2_number      VARCHAR2(10),  -- Phone 2 Number
   phone2_type        VARCHAR2(2),   -- Phone 2 Type
   email_campus       VARCHAR2(100), -- Campus Email
   email_personal     VARCHAR2(100), -- Personal Email
   parent_first_name  VARCHAR2(50),  -- Parent First Name
   parent_middle_name VARCHAR2(50),  -- Parent Middle Name
   parent_last_name   VARCHAR2(50),  -- Parent Last Name
   parent_suffix      VARCHAR2(10),  -- Parent Suffix
   parent_add_line1   VARCHAR2(100), -- Parent Address Line 1
   parent_add_line2   VARCHAR2(50),  -- Parent Address Line 2
   parent_add_city    VARCHAR2(50),  -- Parent Address City
   parent_add_state   VARCHAR2(2),   -- Parent Address State or Province
   parent_add_zip     VARCHAR2(9),   -- Parent Address Zip
   parent_add_country VARCHAR2(50),  -- Parent Country (if not USA)
   parent_email       VARCHAR2(100), -- Parent Email
   parent_phone       VARCHAR2(10),  -- Parent Phone
   parent_cell        VARCHAR2(10),  -- Parent Cell Phone
   parent_int_phone   VARCHAR2(10),  -- Parent International Phone
   other_first_name   VARCHAR2(50),  -- Other Contact First Name
   other_middle_name  VARCHAR2(50),  -- Other Contact Middle Name
   other_last_name    VARCHAR2(50),  -- Other Contact Last Name
   other_suffix       VARCHAR2(10),  -- Other Contact Suffix
   other_relation     VARCHAR2(2),   -- Relationship of Other Contact to Student
   other_add_line1    VARCHAR2(100), -- Other Contact Address Line 1
   other_add_line2    VARCHAR2(50),  -- Other Contact Address Line 2
   other_add_city     VARCHAR2(50),  -- Other Contact Address City
   other_add_state    VARCHAR2(2),   -- Other Contact Address State or Province
   other_add_zip      VARCHAR2(9),   -- Other Contact Address Zip
   other_add_country  VARCHAR2(50),  -- Other Contact Country (if not USA)
   other_email        VARCHAR2(100), -- Other Contact Email
   other_phone        VARCHAR2(10),  -- Other Phone
   other_cell         VARCHAR2(10),  -- Other Cell Phone
   -- Enrollment --------------------------------------------------------------------------------------------------------------
   first_enrl_month   VARCHAR2(2),   -- Date First Enrolled at this Institution (Month)
   first_enrl_day     VARCHAR2(2),   -- Date First Enrolled at this Institution (Day)
   first_enrl_year    VARCHAR2(4),   -- Date First Enrolled at this Institution (Year)
   last_enrl_month    VARCHAR2(2),   -- Date Last Enrolled at this Institution (Month)
   last_enrl_day      VARCHAR2(2),   -- Date Last Enrolled at this Institution (Day)
   last_enrl_year     VARCHAR2(4),   -- Date Last Enrolled at this Institution (Year)

   degree_by_063018   VARCHAR2(2),   -- Expected to complete degree requirements before June 30, 2017?
   has_xfer_hours     VARCHAR2(2),   -- Has your institution accepted transfer credit for this student from another postsecondary institution?
   has_rem_dev_hours  VARCHAR2(2),   -- Since completing high school, has the student taken any remedial/developmental courses to improve their basic skills in English, math, reading, or writing?
   is_first_time_stu  VARCHAR2(2),   -- First-time Beginning Student?
   has_bach_degree    VARCHAR2(1),   -- Ever Received Baccalaureate Degree?
   bach_rec_month     VARCHAR2(2),   -- Date Baccalaureate Received (Month)
   bach_rec_day       VARCHAR2(2),   -- Date Baccalaureate Received (Day)
   bach_rec_year      VARCHAR2(4),   -- Date Baccalaureate Received (Year)
   act_engl_score     VARCHAR2(10),  -- ACT English Score
   act_math_score     VARCHAR2(10),  -- ACT Mathematics Score
   act_read_score     VARCHAR2(10),  -- ACT Reading Score
   act_sci_score      VARCHAR2(10),  -- ACT Science Score
   act_comp_score     VARCHAR2(10),  -- ACT Composite Score
   sat_read_score     VARCHAR2(10),  -- SAT Critical Reading Score
   sat_math_score     VARCHAR2(10),  -- SAT Mathematics Score
   sat_writ_score     VARCHAR2(10),  -- SAT Writing Score

   program_ay1718     VARCHAR2(2),   -- Program/Degree (2017-2018 academic year)
   grad_degree_ay1718 VARCHAR2(2),   -- Graduate Degree Type (FOR GRADUATE DEGREES ONLY) (2017-2018 academic year)
   class_level_ay1718 VARCHAR2(2),   -- Class Level (2017-2018 academic year)
   grad_month_ay1718  VARCHAR2(2),   -- Degree Completion Date (Month) (FOR COMPLETED DEGREES) (2017-2018 academic year)
   grad_day_ay1718    VARCHAR2(2),   -- Degree Completion Date (Day) (FOR COMPLETED DEGREES) (2017-2018 academic year)
   grad_year_ay1718   VARCHAR2(4),   -- Degree Completion Date (Year) (FOR COMPLETED DEGREES) (2017-2018 academic year)
   cum_gpa_ay1718     VARCHAR2(10),  -- Cumulative (Unweighted) GPA (2017-2018 academic year)
   major1_ay1718      VARCHAR2(128), -- First Major (2017-2018 academic year)
   cip1_ay1718        VARCHAR2(6),   -- First Major CIP Code (NNNNNN) (2017-2018 academic year)
   major2_ay1718      VARCHAR2(128), -- Second Major (2017-2018 academic year)
   cip2_ay1718        VARCHAR2(6),   -- Second Major CIP Code (NNNNNN) (2017-2018 academic year)
   undeclared_ay1718  VARCHAR2(2),   -- Major Undeclared (2017-2018 academic year)
   prgm_hrs_ay1718    VARCHAR2(10),  -- Total Number of Clock Hours in Program (2017-2018 academic year)
   hrs_clock_ay1718   VARCHAR2(10),  -- Cumulative Clock Hours Completed (2017-2018 academic year)
   hrs_credit_ay1718  VARCHAR2(10),  -- Total Number of Credit Hours in Program (2017-2018 academic year)
   cum_credits_ay1718 VARCHAR2(10),  -- Cumulative Credit Hours Completed (2017-2018 academic year)
   tuition_ay1718     VARCHAR2(10),  -- TotalTuition and Mandatory Fees Charged ($) (2017-2018 academic year)
   residency_ay1718   VARCHAR2(2),   -- Residency for Tuition Purposes (2017-2018 academic year)
   enroll_summer_ptft VARCHAR2(2),   -- Enrollment Status (2017-2018 academic year)
   enroll_summer_hrs  VARCHAR2(10),  -- Attempted Credits (2017-2018 academic year)
   enroll_fall_ptft   VARCHAR2(2),   -- Enrollment Status (2017-2018 academic year)
   enroll_fall_hrs    VARCHAR2(10),  -- Attempted Credits (2017-2018 academic year)
   enroll_spring_ptft VARCHAR2(2),   -- Enrollment Status (2017-2018 academic year)
   enroll_spring_hrs  VARCHAR2(10)   -- Attempted Credits (2017-2018 academic year)
 );

 ------------------------------------------------------------------------------------------------------------
 -- Add Students

  INSERT INTO enroll.ipeds_npsas_18
              (
                ipeds_fsvn,
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
                major1_ay1718,
                cip1_ay1718,
                major2_ay1718,
                cip2_ay1718,
                dsu_hsgrad_dt,
                hs_completion_year,
                hs_completion_type,
                marital_status,
                undeclared_ay1718,
                grad_month_ay1718,
                grad_day_ay1718,
                grad_year_ay1718
              )
              SELECT '1' AS ipeds_fsvn,
                     '1' AS npsas_eligible,
                     '=VLOOKUP([@[Student-ID]],Table19[#All],2,FALSE)' AS ipeds_studyid,
                     MAX(banner_term),
                     dsc_pidm,
                     '230171' AS ipeds_unitid,
                     s_first,
                     nvl(s_middle,' ') AS s_middle,
                     s_last,
                     nvl(s_suffix,' ') AS s_suffix,
                     spriden_id,
                     spbpers_ssn,
                     substr(s_birth_dt,5,2) AS s_dob_month,
                     substr(s_birth_dt,7,2) AS s_dob_day,
                     substr(s_birth_dt,1,4) AS s_dob_year,
                     CASE s_gender WHEN 'M' THEN 0 ELSE 1 END AS s_gender,
                     s_ethnic,
                     cur_majr1,
                     s_curr_cip,
                     cur_majr2,
                     s_curr_cip2,
                     dsc_hsgrad_dt,
                     substr(dsc_hsgrad_dt,1,4) AS hs_completion_year,
                     CASE WHEN dsc_hsgrad_dt IS NULL THEN NULL
                          WHEN s_high_School = '459995' THEN  2 -- GED
                          WHEN s_high_School = '459996' THEN -1 -- Unknown High School
                          WHEN s_high_School = '459998' THEN  5 -- Home-Schooling
                          WHEN s_high_School = '459999' THEN  4 -- Foreign High School
                          ELSE 1 END AS hs_completion_type,
                     CASE s1.marital_status
                            WHEN 'S' THEN 0
                            WHEN 'M' THEN 1
                            ELSE         -1 END,
                     CASE WHEN cur_majr1 IN ('ND','CE','GE') THEN 1 ELSE 0 END AS undeclared_ay1718,
                     (
                       SELECT to_char(shrdgmr_grad_date,'MM')
                       FROM   shrdgmr
                       WHERE  shrdgmr_pidm       = dsc_pidm
                       AND    shrdgmr_degc_code  = cur_degc1
                       AND    shrdgmr_acyr_code  = '1718'
                       AND    shrdgmr_degs_code IN ('AW','PN')
                     ) AS grad_month_ay1718,
                     (
                       SELECT to_char(shrdgmr_grad_date,'DD')
                       FROM   shrdgmr
                       WHERE  shrdgmr_pidm       = dsc_pidm
                       AND    shrdgmr_degc_code  = cur_degc1
                       AND    shrdgmr_acyr_code  = '1718'
                       AND    shrdgmr_degs_code IN ('AW','PN')
                     ) AS grad_day_ay1718,
                     (
                       SELECT to_char(shrdgmr_grad_date,'YYYY')
                       FROM   shrdgmr
                       WHERE  shrdgmr_pidm       = dsc_pidm
                       AND    shrdgmr_degc_code  = cur_degc1
                       AND    shrdgmr_acyr_code  = '1718'
                       AND    shrdgmr_degs_code IN ('AW','PN')
                     ) AS grad_year_ay1718
              FROM   students03@dscir s1, spbpers, spriden
              WHERE  dsc_pidm = spbpers_pidm
              AND    dsc_pidm = spriden_pidm
              AND    s_entry_action <> 'HS'
              AND    dsc_term_code IN ('20173E','20174E','201823')
              AND    spriden_change_ind IS NULL
              AND   (spbpers_confid_ind IS NULL OR spbpers_confid_ind <> 'Y')
              AND    dsc_term_code =
                     (
                       SELECT max(dsc_term_code)
                       FROM   students03@dscir s2
                       WHERE  s2.dsc_pidm = s1.dsc_pidm
                       AND    s2.s_entry_action <> 'HS'
                       AND    s2.dsc_term_code IN ('20173E','20174E','201823')
                     )
              AND    s_banner_id IN ('00235885','00152735','00364993','00344762','00362000','00369609','00297306','00318349',
                          '00364133','00336420','00198506','00341176','00327654','00209641','00327043','00285386','00287333',
                          '00363074','00377936','00390385','00322849','00351977','00377617','00359718','00307133','00353946',
                          '00294593','00011889','00328695','00282031','00341910','00295845','00239214','00382788','00363861',
                          '00317996','00324396','00286332','00260565','00377749','00330647','00356468','00175333','00237374',
                          '00357311','00265120','00227888','00352901','00376895','00304992','00023483','00247500','00305473',
                          '00099626','00310348','00168549','00037836','00134477','00198697','00195009','00104576','00271356',
                          '00234623','00045569','00047834','00105542','00339291','00051662','00053335','00353870','00247530',
                          '00059117','00356781','00375286','00177532','00146553','00062228','00165539','00208318','00089910',
                          '00173361','00221316','00265044','00219826','00272830','00274800','00377643','00282231','00234676',
                          '00265490','00297620','00348207','00270324','00336238','00274157','00336731','00331120','00365355',
                          '00068244','00290823','00218858','00349440','00071142','00327487','00353550','00230271','00205624',
                          '00351070','00354614','00353293','00375745','00317175','00346434','00337023','00376796','00354756',
                          '00365774','00376362','00289276','00308416','00286950','00285515','00363736','00309617','00291714',
                          '00357713','00307842','00352598','00352334','00297387','00275987','00338612','00339388','00257343',
                          '00333555','00336366','00353881','00287334','00253484','00376785','00337446','00335774','00326768',
                          '00338477','00256848','00307645','00357142','00335619','00325546','00268952','00357685','00318334',
                          '00287373','00309695','00309762','00362022','00199119','00369989','00292162','00309750','00333318',
                          '00379841','00375911','00078785','00272563','00328011','00309390','00306585','00285492','00337646',
                          '00366409','00260941','00339400','00197365','00189610','00365001','00199790','00380167','00376398',
                          '00131329','00242251','00366708','00222221','00259085','00253851','00251789','00257149','00285416',
                          '00236144','00264498','00294391','00275516','00236140','00254737','00285794','00294288','00279739',
                          '00237496','00234444','00304454','00383963','00358597','00275217','00347090','00365105','00380117',
                          '00300998','00301180','00340009','00306042','00285840','00296447','00303777','00310511','00307861',
                          '00320577','00318997','00318648','00322800','00320362','00331028','00306235','00317448','00377662',
                          '00305129','00329328','00335471','00318809','00375296','00305815','00322462','00332037','00357625',
                          '00362217','00337590','00352783','00347309','00361914','00359084','00366116','00344414','00348241',
                          '00343380','00337434','00349129','00346412','00365334','00284431','00354978','00357171','00357508',
                          '00345107','00341969','00356544','00354689','00364479','00326358','00081601','00282820','00227965',
                          '00352824','00172725','00083370','00271613','00191198','00216156','00235034','00185552','00324565',
                          '00239980','00235667','00377680','00228737','00221435','00255938','00256716','00236046','00274409',
                          '00256660','00317102','00369526','00316366','00330589','00283330','00364261','00286517','00236389',
                          '00296328','00351090','00273040','00343507','00386332','00290247','00237377','00263549','00278845',
                          '00364397','00309269','00274598','00274608','00308180','00308752','00309387','00301867','00313409',
                          '00285761','00320841','00298321','00336800','00208312','00341795','00323456','00269029','00317031',
                          '00204566','00318909','00377640','00361264','00321965','00324424','00322539','00318880','00348511',
                          '00318810','00380705','00344567','00342561','00323808','00347452','00346833','00343207','00326863',
                          '00361302','00326820','00365756','00340267','00351739','00323537','00354285','00352545','00313749',
                          '00370048','00366159','00349962','00311920','00318373','00357161','00255333','00230922','00311819',
                          '00311371','00340024','00324653','00324738','00332768','00309112','00369590','00325012','00359484',
                          '00364424','00354046','00268946','00362814','00349064','00376890','00355355','00359907','00377482',
                          '00369987','00334329','00353661','00351628','00351716','00324117','00326892'
                        )
              GROUP  BY dsc_pidm,
                        dsc_pidm,
                        s_first,
                        nvl(s_middle,' '),
                        s_last,
                        nvl(s_suffix,' '),
                        spriden_id,
                        spbpers_ssn,
                        substr(s_birth_dt,5,2),
                        substr(s_birth_dt,7,2),
                        substr(s_birth_dt,1,4),
                        CASE s_gender WHEN 'M' THEN 0 ELSE 1 END,
                        CASE marital_status
                             WHEN 'S' THEN 0
                             WHEN 'M' THEN 1
                             ELSE         -1 END,
                        s_ethnic,
                        cur_majr1,
                        s_curr_cip,
                        cur_degc1,
                        cur_majr2,
                        s_curr_cip2,
                        dsc_hsgrad_dt,
                     substr(dsc_hsgrad_dt,1,4),
                     CASE WHEN dsc_hsgrad_dt IS NULL THEN NULL
                          WHEN s_high_School = '459995' THEN  2 -- GED
                          WHEN s_high_School = '459996' THEN -1 -- Unknown High School
                          WHEN s_high_School = '459998' THEN  5 -- Home-Schooling
                          WHEN s_high_School = '459999' THEN  4 -- Foreign High School
                          ELSE 1 END,
                        CASE substr(cur_degc1,1,1)
                                 WHEN 'B' THEN '4'
                                 WHEN 'A' THEN '3'
                                 WHEN 'C' THEN '2'
                                 ELSE          '1' END;

 ------------------------------------------------------------------------------------------------------------

 -- Veteran Status
    UPDATE enroll.ipeds_npsas_18
    SET    veteran_status =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   sgrvetn
             WHERE  sgrvetn_pidm = dsu_pidm
           ) THEN 1 ELSE 0 END;


 -- Ethnicities

    UPDATE enroll.ipeds_npsas_18 SET race_white    = CASE WHEN ethnicity = 'W' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_18 SET race_black    = CASE WHEN ethnicity = 'B' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_18 SET race_asian    = CASE WHEN ethnicity = 'A' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_18 SET race_indian   = CASE WHEN ethnicity = 'I' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_18 SET race_hawaiian = CASE WHEN ethnicity = 'P' THEN 1 ELSE 0 END;
    UPDATE enroll.ipeds_npsas_18 SET ethnicity     = CASE WHEN ethnicity = 'H' THEN 1
                                                          WHEN ethnicity = 'U' THEN -1
                                                                               ELSE  0 END;

 -- Permanent Address
    UPDATE enroll.ipeds_npsas_18
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
    UPDATE enroll.ipeds_npsas_18
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


 -- Indicator: Is student permanent resident of state of institution
    UPDATE enroll.ipeds_npsas_18
    SET    is_perm_resd =
           CASE
           (
             SELECT s1.sgbstdn_resd_code
             FROM   sgbstdn s1
             WHERE  s1.sgbstdn_pidm = dsu_pidm
             AND    s1.sgbstdn_term_code_eff =
                    (
                      SELECT MAX(s2.sgbstdn_term_code_eff)
                      FROM   sgbstdn s2
                      WHERE  s2.sgbstdn_pidm = dsu_pidm
                    )
           )
           WHEN 'A' THEN 1
           WHEN 'C' THEN 1
           WHEN 'G' THEN 0
           WHEN 'N' THEN 0
           WHEN 'R' THEN 1
           ELSE -1 END;

 -- Spouse's Information
    UPDATE enroll.ipeds_npsas_18
    SET    spouse_first_name =
           (
             SELECT spremrg_first_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('P','X')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('P','X')
                    )
           ),
           spouse_middle_name =
           (
             SELECT spremrg_mi
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('P','X')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('P','X')
                    )
           ),
           spouse_last_name =
           (
             SELECT spremrg_last_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('P','X')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('P','X')
                    )
           );

 -- Citizenship Status
    UPDATE enroll.ipeds_npsas_18
    SET    citizenship_status =
           (
             SELECT CASE spbpers_citz_code
                         WHEN '1' THEN 1
                         WHEN '2' THEN 3
                         WHEN '3' THEN 2
                         ELSE -1 END
             FROM   spbpers
             WHERE  spbpers_pidm = dsu_pidm
           );
 -- Student's Local Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_18
    SET    phone1_number =
           (
             SELECT s1.sprtele_phone_area||s1.sprtele_phone_number
             FROM   sprtele s1
             WHERE  s1.sprtele_pidm = dsu_pidm
             AND    s1.sprtele_tele_code = '01'
             AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
             AND    LENGTH(s1.sprtele_phone_area) = '3'
             AND    s1.sprtele_seqno =
                    (
                      SELECT MAX(s2.sprtele_seqno)
                      FROM   sprtele s2
                      WHERE  s2.sprtele_pidm = s1.sprtele_pidm
                      AND    s2.sprtele_tele_code = '01'
                      AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
                      AND    LENGTH(s1.sprtele_phone_area) = '3'
                    )
           );

    UPDATE enroll.ipeds_npsas_18
    SET    phone1_type = '1'
    WHERE  phone1_number IS NOT NULL;

 -- Student's Cell Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_18
    SET    phone2_number =
           (
             SELECT substr(s1.sprtele_phone_area||s1.sprtele_phone_number,1,10)
             FROM   sprtele s1
             WHERE  s1.sprtele_pidm = dsu_pidm
             AND    s1.sprtele_tele_code = 'CELL'
             AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
             AND    LENGTH(s1.sprtele_phone_area) = '3'
             AND    s1.sprtele_seqno =
                    (
                      SELECT MAX(s2.sprtele_seqno)
                      FROM   sprtele s2
                      WHERE  s2.sprtele_pidm = s1.sprtele_pidm
                      AND    s2.sprtele_tele_code = 'CELL'
                      AND    LENGTH(trim(translate(s1.sprtele_phone_area,' +-.0123456789',' '))) IS NULL
                      AND    LENGTH(s1.sprtele_phone_area) = '3'
                    )
           );

    UPDATE enroll.ipeds_npsas_18
    SET    phone2_type = '2'
    WHERE  phone2_number IS NOT NULL;

 -- Student's Work Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_18
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

    UPDATE enroll.ipeds_npsas_18
    SET    phone1_type = '3'
    WHERE  phone1_number IS NOT NULL
    AND    phone1_type IS NULL;

 -- Student's Other Phone Area Code and Phone Number
    UPDATE enroll.ipeds_npsas_18
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

    UPDATE enroll.ipeds_npsas_18
    SET    phone1_type = '4'
    WHERE  phone1_number IS NOT NULL
    AND    phone1_type IS NULL;

 -- Student's Campus Email Address
    UPDATE enroll.ipeds_npsas_18
    SET    email_campus =
           (
             SELECT goremal_email_address
             FROM   goremal
             WHERE  ROWID = dsc.f_get_email_rowid(dsu_pidm,'STU_EMAIL','A',1)
           );

 -- Student's Personal Email Address
    UPDATE enroll.ipeds_npsas_18
    SET    email_personal =
           (
             SELECT goremal_email_address
             FROM   goremal
             WHERE  ROWID = dsc.f_get_email_rowid(dsu_pidm,'P_EMAIL','A',1)
           );

 -- Parent's Information
    UPDATE enroll.ipeds_npsas_18
    SET    parent_first_name =
           (
             SELECT spremrg_first_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_middle_name =
           (
             SELECT spremrg_mi
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_last_name =
           (
             SELECT spremrg_last_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_line1 =
           (
             SELECT spremrg_street_line1
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_line2 =
           (
             SELECT spremrg_street_line2
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_city =
           (
             SELECT spremrg_city
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_state =
           (
             SELECT spremrg_stat_code
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_zip =
           (
             SELECT substr(regexp_replace(spremrg_zip, '[^0-9]', ''),1,5)
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_add_country =
           (
             SELECT spremrg_natn_code
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
            AND     spremrg_natn_code <> 'US'
           ),
           parent_phone =
           (
             SELECT regexp_replace(spremrg_phone_area||spremrg_phone_number, '[^0-9]', '')
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_relt_code IN ('M','F')
             AND    length(regexp_replace(spremrg_phone_area||spremrg_phone_number, '[^0-9]', '')) = 10
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_relt_code IN ('M','F')
                    )
           ),
           parent_email =
           (
             SELECT goremal_email_address
             FROM   goremal
             WHERE  goremal_pidm = dsu_pidm
             AND    goremal_emal_code = 'PAR'
             AND    ROWNUM = 1
           );

    UPDATE enroll.ipeds_npsas_18
    SET    parent_first_name =
           (
             SELECT sorfolk_parent_first
             FROM   sorfolk
             WHERE  sorfolk_pidm = dsu_pidm
             AND    sorfolk_relt_code IN ('M','F')
             AND    ROWNUM = 1
           ),
           parent_middle_name =
           (
             SELECT sorfolk_parent_mi
             FROM   sorfolk
             WHERE  sorfolk_pidm = dsu_pidm
             AND    sorfolk_relt_code IN ('M','F')
             AND    ROWNUM = 1
           ),
           parent_last_name =
           (
             SELECT sorfolk_parent_last
             FROM   sorfolk
             WHERE  sorfolk_pidm = dsu_pidm
             AND    sorfolk_relt_code IN ('M','F')
             AND    ROWNUM = 1
           )
    WHERE  parent_first_name IS NULL
    AND    parent_last_name  IS NULL;



 -- Other Contact's Information
 -- Excludes spouse and parent information since it's already been provided.
    UPDATE enroll.ipeds_npsas_18
    SET    other_first_name =
           (
             SELECT spremrg_first_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_middle_name =
           (
             SELECT spremrg_mi
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_last_name =
           (
             SELECT spremrg_last_name
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_relation =
           (
             SELECT CASE spremrg_relt_code
                         WHEN 'M' THEN 1
                         WHEN 'F' THEN 1
                         WHEN 'U' THEN 2
                         WHEN 'S' THEN 3
                         WHEN 'B' THEN 3
                         WHEN 'T' THEN 4
                         WHEN 'G' THEN 6
                         WHEN 'P' THEN 7
                         WHEN 'R' THEN 8
                         ELSE 10 END
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_add_line1 =
           (
             SELECT spremrg_street_line1
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_add_line2 =
           (
             SELECT spremrg_street_line2
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_add_city =
           (
             SELECT spremrg_city
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_add_state =
           (
             SELECT spremrg_stat_code
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_add_zip =
           (
             SELECT regexp_replace(spremrg_zip, '[^0-9]', '')
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                    )
           ),
           other_add_country =
           (
             SELECT spremrg_natn_code
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           ),
           other_phone =
           (
             SELECT regexp_replace(spremrg_phone_area||spremrg_phone_number, '[^0-9]', '')
             FROM   spremrg
             WHERE  spremrg_pidm = dsu_pidm
             AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
             AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
             AND    length(regexp_replace(spremrg_phone_area||spremrg_phone_number, '[^0-9]', '')) = 10
             AND    spremrg_priority =
                    (
                      SELECT MAX(spremrg_priority)
                      FROM   spremrg
                      WHERE  spremrg_pidm = dsu_pidm
                      AND    LENGTH(regexp_replace(spremrg_phone_area||spremrg_phone_number, '[^0-9]', '')) = 10
                      AND    spremrg_first_name||spremrg_last_name != parent_first_name||parent_last_name
                      AND    spremrg_first_name||spremrg_last_name != spouse_first_name||spouse_last_name
                    )
           );

 -- Date of First Enrollment
    UPDATE enroll.ipeds_npsas_18
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
    UPDATE enroll.ipeds_npsas_18
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

 -- Date of Last Enrollment
    UPDATE enroll.ipeds_npsas_18
    SET    last_enrl_month =
           (
             SELECT to_char(stvterm_end_date,'MM')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MAX(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           ),
           last_enrl_day =
           (
             SELECT to_char(stvterm_end_date,'DD')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MAX(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           ),
           last_enrl_year =
           (
             SELECT to_char(stvterm_end_date,'YYYY')
             FROM   stvterm, students03@dscir
             WHERE  stvterm_code = substr(dsc_term_code,1,5)||0
             AND    dsc_pidm = dsu_pidm
             AND    dsc_term_code =
                    (
                      SELECT MAX(dsc_term_code)
                      FROM   students03@dscir
                      WHERE  dsc_pidm = dsu_pidm
                    )
           );
 -- Transfer Credits Indicator
    UPDATE enroll.ipeds_npsas_18
    SET    has_xfer_hours =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    s_trans_total > 0
           ) THEN 1 ELSE 0 END;


 -- Remedial Credits Indicator
    UPDATE enroll.ipeds_npsas_18
    SET    has_rem_dev_hours =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   as_academic_history_detail
             WHERE  dsu_pidm = pidm_key
             AND    ((
                           subj_code = ('MATH')
                     AND ( crse_number LIKE '0%' OR crse_number IN ('1000','1010'))
                    )
             OR     (      subj_code = ('ENGL')
                     AND ( crse_number LIKE '0%' OR crse_number = ('1470'))
                    ))
           ) THEN 1 ELSE 0 END;


 -- First-time Student
    UPDATE enroll.ipeds_npsas_18
    SET    is_first_time_stu =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   students03@dscir
             WHERE  s_year = 2018
             AND    dsc_pidm = dsu_pidm
             AND    s_entry_action IN ('FF','FH')
           )
           THEN 1 ELSE 0 END;


 -- Bachelor's Degree Information
    UPDATE enroll.ipeds_npsas_18
    SET    has_bach_degree =
           CASE WHEN EXISTS
           (
             SELECT 1
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code LIKE 'B%'
             AND    shrdgmr_degs_code = 'AW'
             AND    shrdgmr_grad_date < SYSDATE
           ) THEN 1 ELSE 0 END,
           bach_rec_month =
           (
             SELECT DISTINCT to_char(shrdgmr_grad_date,'MM')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code LIKE 'B%'
             AND    shrdgmr_degs_code = 'AW'
             AND    shrdgmr_grad_date < sysdate
             AND    shrdgmr_grad_date =
                    (
                      SELECT min(shrdgmr_grad_date)
                      FROM   shrdgmr
                      WHERE  shrdgmr_pidm = dsu_pidm
                      AND    shrdgmr_degc_code LIKE 'B%'
                      AND    shrdgmr_degs_code = 'AW'
                      AND    shrdgmr_grad_date < sysdate
                    )
           ),
           bach_rec_day =
           (
             SELECT DISTINCT to_char(shrdgmr_grad_date,'DD')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code LIKE 'B%'
             AND    shrdgmr_degs_code = 'AW'
             AND    shrdgmr_grad_date < sysdate
             AND    shrdgmr_grad_date =
                    (
                      SELECT min(shrdgmr_grad_date)
                      FROM   shrdgmr
                      WHERE  shrdgmr_pidm = dsu_pidm
                      AND    shrdgmr_degc_code LIKE 'B%'
                      AND    shrdgmr_degs_code = 'AW'
                      AND    shrdgmr_grad_date < sysdate
                    )
           ),
           bach_rec_year =
           (
             SELECT DISTINCT to_char(shrdgmr_grad_date,'YYYY')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code LIKE 'B%'
             AND    shrdgmr_degs_code = 'AW'
             AND    shrdgmr_grad_date < sysdate
             AND    shrdgmr_grad_date =
                    (
                      SELECT min(shrdgmr_grad_date)
                      FROM   shrdgmr
                      WHERE  shrdgmr_pidm = dsu_pidm
                      AND    shrdgmr_degc_code LIKE 'B%'
                      AND    shrdgmr_degs_code = 'AW'
                      AND    shrdgmr_grad_date < sysdate
                    )
           );

 -- ACT Test Scores: ----------------------------------------------------------------------------------------
    UPDATE enroll.ipeds_npsas_18
    SET    act_engl_score =
           ( -- ACT English
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('A01','A07','NEW')
             AND    sortest_test_score BETWEEN 0 and 36
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('A01','A07','NEW')
                      AND    sortest_test_score BETWEEN 0 and 36
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           act_math_score =
           ( -- ACT Math
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('A02','A02N')
             AND    sortest_test_score BETWEEN 0 and 36
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('A02','A02N')
                      AND    sortest_test_score BETWEEN 0 and 36
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           act_read_score =
           ( -- ACT Reading
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('A03')
             AND    sortest_test_score BETWEEN 0 and 36
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('A03')
                      AND    sortest_test_score BETWEEN 0 and 36
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           act_sci_score =
           ( -- ACT Science
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('A04')
             AND    sortest_test_score BETWEEN 0 and 36
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('A04')
                      AND    sortest_test_score BETWEEN 0 and 36
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           act_comp_score =
           ( -- ACT Composite
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('A05')
             AND    sortest_test_score BETWEEN 0 and 36
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('A05')
                      AND    sortest_test_score BETWEEN 0 and 36
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           );

 -- SAT Test Scores:
    UPDATE enroll.ipeds_npsas_18
    SET    sat_read_score =
           ( -- SAT Reading
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('S01')
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('S01')
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           sat_math_score =
           ( -- SAT Math
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('S02','S02N')
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('S02','S02N')
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           ),
           sat_writ_score =
           ( -- SAT Writing
             SELECT MAX(to_number(sortest_test_score))
             FROM   sortest
             WHERE  sortest_pidm = dsu_pidm
             AND    sortest_tesc_code IN ('S07')
             AND    sortest_test_date =
                    (
                      SELECT MAX(sortest_test_date)
                      FROM   sortest
                      WHERE  sortest_pidm = dsu_pidm
                      AND    sortest_tesc_code IN ('S07')
                      GROUP  BY sortest_pidm
                    )
             GROUP BY dsu_pidm
           );

 -- AY 2016-2017 --------------------------------------------------------------------------------------------



 -- Program
    UPDATE enroll.ipeds_npsas_18
    SET    program_ay1718 =
           (
             SELECT CASE substr(s1.cur_degc1,1,1)
                         WHEN 'B' THEN '4'
                         WHEN 'A' THEN '3'
                         WHEN 'C' THEN '2'
                         ELSE          '1' END
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Class Level
    UPDATE enroll.ipeds_npsas_18
    SET    class_level_ay1718 =
           (
             SELECT CASE s1.s_level
                         WHEN 'FR' THEN '1'
                         WHEN 'SO' THEN '2'
                         WHEN 'JR' THEN '3'
                         WHEN 'SR' THEN '4'
                         ELSE           '5' END
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Graduation Date (if graduated)
    UPDATE enroll.ipeds_npsas_18
    SET    grad_month_ay1718 =
           (
             SELECT to_char(shrdgmr_grad_date,'MM')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code NOT LIKE 'C%'
             AND    shrdgmr_degs_code IN ('AW','PN')
             AND    shrdgmr_acyr_code = '1718'
           ),
           grad_day_ay1718 =
           (
             SELECT to_char(shrdgmr_grad_date,'DD')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code NOT LIKE 'C%'
             AND    shrdgmr_degs_code IN ('AW','PN')
             AND    shrdgmr_acyr_code = '1718'
           ),
           grad_year_ay1718 =
           (
             SELECT to_char(shrdgmr_grad_date,'YYYY')
             FROM   shrdgmr
             WHERE  shrdgmr_pidm = dsu_pidm
             AND    shrdgmr_degc_code NOT LIKE 'C%'
             AND    shrdgmr_degs_code IN ('AW','PN')
             AND    shrdgmr_acyr_code = '1718'
           );

 -- Cumulative GPA
    UPDATE enroll.ipeds_npsas_18
    SET    cum_gpa_ay1718 =
           (
             SELECT s1.s_cum_gpa_ugrad
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Current Major 1
    UPDATE enroll.ipeds_npsas_18
    SET    major1_ay1718 =
           (
             SELECT stvmajr_desc
             FROM   students03@dscir s1, stvmajr
             WHERE  s1.cur_majr1 = stvmajr_code
             AND    s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Current Major CIP Code 1
    UPDATE enroll.ipeds_npsas_18
    SET    cip1_ay1718 =
           (
             SELECT s1.s_curr_cip
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Current Major 2
    UPDATE enroll.ipeds_npsas_18
    SET    major2_ay1718 =
           (
             SELECT stvmajr_desc
             FROM   students03@dscir s1, stvmajr
             WHERE  s1.cur_majr2 = stvmajr_code
             AND    s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Current Major CIP Code 2
    UPDATE enroll.ipeds_npsas_18
    SET    cip2_ay1718 =
           (
             SELECT s1.s_curr_cip2
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
             AND    s1.s_curr_cip2 <> ' '
           );

 -- Current Major CIP Code 2
    UPDATE enroll.ipeds_npsas_18
    SET    cum_credits_ay1718 =
           (
             SELECT s1.s_cum_hrs_ugrad
             FROM   students03@dscir s1
             WHERE  s1.dsc_pidm = dsu_pidm
             AND    s1.s_year = '2018'
             AND    s1.dsc_term_code =
                    (
                      SELECT MAX(s2.dsc_term_code)
                      FROM   students03@dscir s2
                      WHERE  s2.dsc_pidm = dsu_pidm
                      AND    s2.s_year = '2018'
                    )
           );

 -- Charged Tuition Fees:
    UPDATE enroll.ipeds_npsas_18
    SET    tuition_ay1718 =
           (
             SELECT sum(tbraccd_amount)
             FROM   tbraccd
             WHERE  tbraccd_pidm = dsu_pidm
             AND    tbraccd_term_code IN ('201730','201740','201820')
             AND    tbraccd_detail_code < '2101'
           );

 -- Tuition Residency:
    UPDATE enroll.ipeds_npsas_18
    SET    residency_ay1718 = CASE
           (
             SELECT sgbstdn_resd_code
             FROM   sgbstdn
             WHERE  sgbstdn_pidm = dsu_pidm
             AND    sgbstdn_term_code_eff =
                    (
                      SELECT MAX(sgbstdn_term_code_eff)
                      FROM   sgbstdn
                      WHERE  sgbstdn_pidm = dsu_pidm
                      AND    sgbstdn_term_code_eff <=
                             (
                               SELECT MAX(substr(dsc_term_code,1,5)||0)
                               FROM   students03@dscir
                               WHERE  dsc_pidm = dsu_pidm
                             )
                    )
           ) WHEN 'R' THEN 2
             WHEN 'C' THEN 2
             WHEN 'S' THEN 2
             WHEN 'A' THEN 2
             WHEN 'M' THEN 2
             WHEN 'G' THEN 3
             WHEN 'N' THEN 3
             WHEN '0' THEN 3
             END;


 -- Enrollments
    UPDATE enroll.ipeds_npsas_18
    SET    enroll_summer_ptft =
           (
             SELECT s_pt_ft
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20173E'
           ),
           enroll_summer_hrs =
           (
             SELECT s_term_att_cr
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20173E'
           );

    UPDATE enroll.ipeds_npsas_18
    SET    enroll_fall_ptft =
           (
             SELECT s_pt_ft
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20174E'
           ),
           enroll_fall_hrs =
           (
             SELECT s_term_att_cr
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20174E'
           );

    UPDATE enroll.ipeds_npsas_18
    SET    enroll_spring_ptft =
           (
             SELECT s_pt_ft
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20182E'
           ),
           enroll_spring_hrs =
           (
             SELECT s_term_att_cr
             FROM   students03@dscir
             WHERE  dsc_pidm = dsu_pidm
             AND    dsc_term_code = '20182E'
           );

 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------

 -- General Information

    SELECT ipeds_fsvn,
           ipeds_instid,
           ipeds_studyid,
           ipeds_studentid,
           first_name,
           middle_name,
           last_name,
           suffix,
           ssn,
           dob_month,
           dob_day,
           dob_year,
           gender,
           npsas_eligible,
           ineligible_reason,
           marital_status,
           maiden_name,
           spouse_first_name,
           spouse_middle_name,
           spouse_last_name,
           citizenship_status,
           veteran_status,
           hs_completion_type,
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
           perm_add_zip,
           perm_add_country,
           is_perm_resd,
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
           email_personal,
           parent_first_name,
           parent_middle_name,
           parent_last_name,
           parent_suffix,
           parent_add_line1,
           parent_add_line2,
           parent_add_city,
           parent_add_state,
           parent_add_zip,
           parent_add_country,
           parent_email,
           parent_phone,
           parent_cell,
           parent_int_phone,
           other_first_name,
           other_middle_name,
           other_last_name,
           other_suffix,
           other_relation,
           other_add_line1,
           other_add_line2,
           other_add_city,
           other_add_state,
           other_add_zip,
           other_add_country,
           other_email,
           other_phone,
           other_cell
    FROM   enroll.ipeds_npsas_18;

 -- Enrollment

    SELECT ipeds_fsvn,
           ipeds_instid,
           ipeds_studyid,
           ipeds_studentid,
           first_name,
           middle_name,
           last_name,
           first_enrl_month,
           first_enrl_day,
           first_enrl_year,
           last_enrl_month,
           last_enrl_day,
           last_enrl_year,
           degree_by_063018,
           has_xfer_hours,
           has_rem_dev_hours,
           is_first_time_stu,
           has_bach_degree,
           bach_rec_month,
           bach_rec_day,
           bach_rec_year,
           act_engl_score,
           act_math_score,
           act_read_score,
           act_sci_score,
           act_comp_score,
           sat_read_score,
           sat_math_score,
           sat_writ_score,
           program_ay1718,
           grad_degree_ay1718,
           class_level_ay1718,
           grad_month_ay1718,
           grad_day_ay1718,
           grad_year_ay1718,
           cum_gpa_ay1718,
           major1_ay1718,
           cip1_ay1718,
           major2_ay1718,
           cip2_ay1718,
           undeclared_ay1718,
           prgm_hrs_ay1718,
           hrs_clock_ay1718,
           hrs_credit_ay1718,
           cum_credits_ay1718,
           tuition_ay1718,
           residency_ay1718,
           enroll_summer_ptft,
           enroll_summer_hrs,
           enroll_fall_ptft,
           enroll_fall_hrs,
           enroll_spring_ptft,
           enroll_spring_hrs
    FROM   enroll.ipeds_npsas_18;

 --------------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------------------------


-- end of file