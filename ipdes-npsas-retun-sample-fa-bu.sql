WITH student_list AS
    (
      SELECT pidm,
             banner_id,
             dsc_term_code,
             first_name,
             middle_name,
             last_name,
             1 AS registered,
             budget_period,
             student_residence,
             tuition_and_fees,
             books_and_supplies,
             room_and_board,
             0 AS health_insurance,
             transportation,
             computer_and_tech,
             0 AS all_other,
             tuition_and_fees + books_and_supplies + room_and_board + transportation + computer_and_tech AS budget_total,
             financial_aid_warning,
             financial_aid_probation,
             financial_aid_ineligibility,
             federal_elegibility,
             pell_grant,
             direct,
             unsubsidized,
             plus,
             '' AS teach,
             perkins,
             seog,
             work_study,
             '' AS service_grant,
             veteran,
             -- State Aid
             CASE WHEN state_count >  0 THEN 1 ELSE 0 END AS state_aid,
             CASE WHEN state_count  = 1 THEN state_programs
                  WHEN state_count >= 2 THEN substr(state_programs, 1,instr(state_programs,'`',1,1) - 1 )
                  END AS state_program_1,
             CASE WHEN state_count  = 2 THEN substr(state_programs, instr(state_programs,'`',1,1)+1, length(state_programs)-1 )
                  WHEN state_count >= 3 THEN substr(state_programs, instr(state_programs,'`',1,1)+1, instr(state_programs,'`',1,2) - instr(state_programs,'`',1,1) - 1 )
                  END  AS state_program_2,
             CASE WHEN state_count >= 3 THEN substr(state_programs, instr(state_programs,'`',1,2)+1, length(state_programs) )
                  END AS state_program_3,
             -- Institution Aid
             CASE WHEN institution_count >  0 THEN 1 ELSE 0 END AS institution_aid,
             CASE WHEN institution_count  = 1 THEN institution_programs
                  WHEN institution_count >= 2 THEN substr(institution_programs, 1,instr(institution_programs,'`',1,1) - 1 )
                  END AS institution_program_1,
             CASE WHEN institution_count  = 2 THEN substr(institution_programs, instr(institution_programs,'`',1,1)+1, length(institution_programs)-1 )
                  WHEN institution_count >= 3 THEN substr(institution_programs, instr(institution_programs,'`',1,1)+1, instr(institution_programs,'`',1,2) - instr(institution_programs,'`',1,1) - 1 )
                  END  AS institution_program_2,
             CASE WHEN institution_count >= 3 THEN substr(institution_programs, instr(institution_programs,'`',1,2)+1, length(institution_programs) )
                  END AS institution_program_3,
             -- Private Aid
             CASE WHEN private_count >  0 THEN 1 ELSE 0 END AS private_aid,
             CASE WHEN private_count  = 1 THEN private_programs
                  WHEN private_count >= 2 THEN substr(private_programs, 1,instr(private_programs,'`',1,1) - 1 )
                  END AS private_program_1,
             CASE WHEN private_count  = 2 THEN substr(private_programs, instr(private_programs,'`',1,1)+1, length(private_programs)-1 )
                  WHEN private_count >= 3 THEN substr(private_programs, instr(private_programs,'`',1,1)+1, instr(private_programs,'`',1,2) - instr(private_programs,'`',1,1) - 1 )
                  END  AS private_program_2,
             CASE WHEN private_count >= 3 THEN substr(private_programs, instr(private_programs,'`',1,2)+1, length(private_programs) )
                  END AS private_program_3,
             -- Other aid
             CASE WHEN other_count >  0 THEN 1 ELSE 0 END AS other_aid,
             CASE WHEN other_count  = 1 THEN other_programs
                  WHEN other_count >= 2 THEN substr(other_programs, 1,instr(other_programs,'`',1,1) - 1 )
                  END AS other_program_1,
             CASE WHEN other_count  = 2 THEN substr(other_programs, instr(other_programs,'`',1,1)+1, length(other_programs)-1 )
                  WHEN other_count >= 3 THEN substr(other_programs, instr(other_programs,'`',1,1)+1, instr(other_programs,'`',1,2) - instr(other_programs,'`',1,1) - 1 )
                  END  AS other_program_2,
             CASE WHEN other_count >= 3 THEN substr(other_programs, instr(other_programs,'`',1,2)+1, length(other_programs) )
                  END AS other_program_3,
                  rn
             -- Other aid
      FROM   (
               SELECT DISTINCT
                      spriden_pidm       AS pidm,
                      spriden_id         AS banner_id,
                      dsc_term_code      AS dsc_term_code,
                      spriden_last_name  AS last_name,
                      spriden_first_name AS first_name,
                      spriden_mi         AS middle_name,
                      CASE WHEN ( SELECT count(distinct banner_term)
                                  FROM   students03@dscir
                                  WHERE  dsc_pidm = spriden_pidm
                                  AND    s_year = 2018
                                ) >= 2
                           THEN decode(( SELECT sum(sc_att_cr)/10 - mod(sum(sc_att_cr)/20,3)
                                         FROM   student_courses@dscir
                                         WHERE  dsc_pidm   = spriden_pidm
                                         AND    sc_year    = 2018
                                         AND    sc_extract = 'E'
                                       ), 0, '9', -- Error, this shouldn't happen.
                                          3, '7', -- Less than Half-Time, Full-Year
                                          6, '5', -- Half-Time, Full-Year
                                          9, '3', -- 3/4-Time,  Full-Year
                                         12, '1', -- Full-Time, Full-Year
                                             '1') -- Full-Time, Full-Year
                           ELSE decode(( SELECT sum(sc_att_cr)/10 - mod(sum(sc_att_cr)/10,3)
                                         FROM   student_courses@dscir
                                         WHERE  dsc_pidm   = spriden_pidm
                                         AND    sc_year    = 2018
                                         AND    sc_extract = 'E'
                                       ), 0, '9', -- Error, this shouldn't happen.
                                          3, '8', -- Less than Half-Time, Full-Year
                                          6, '6', -- Half-Time, One Term
                                          9, '4', -- 3/4-Time,  One Term
                                         12, '2', -- Full-Time, One Term
                                             '1') -- Full-Time, One Term
                      END AS budget_period,
                      nvl((
                        SELECT decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                        FROM   rcrapp1
                        WHERE  rcrapp1_pidm = spriden_pidm
                        AND    rcrapp1_aidy_code = 1718
                        AND   (rcrapp1_curr_rec_ind = 'Y' OR rcrapp1_curr_rec_ind IS NULL)
                      ),'-1') AS student_residence,
                      -- Found on IPEDS IC - Part D - Undergraduate Student Charges
                      CASE WHEN s_regent_res IN ('A','M','R') THEN (4308+722) ELSE (13776+772) END AS tuition_and_fees,
                      (
                        SELECT avg(rbrcomp_amt)
                        FROM   rbrcomp
                        WHERE  rbrcomp_aidy_code = '1718'
                        AND    rbrcomp_btyp_code = 'CAMP'
                        AND    rbrcomp_aprd_code = 'FA/SPR'
                        AND    regexp_like(rbrcomp_bgrp_code,
                                           CASE nvl(( SELECT DISTINCT decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                      FROM   rcrapp1
                                                      WHERE  rcrapp1_pidm = spriden_pidm
                                                      AND    rcrapp1_aidy_code = '1718'
                                                      AND   (rcrapp1_curr_rec_ind = 'Y' OR rcrapp1_curr_rec_ind IS NULL)
                                                    ),'-1')
                                           WHEN '1' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '2' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '3' THEN '^(NONRES|RESID|GNNR)'
                                                    ELSE '^(NONRES|RESID|GNNR)' END)
                        AND    rbrcomp_comp_code = 'B+S'
                      ) AS books_and_supplies,
                      (
                        SELECT avg(rbrcomp_amt) + (30 * 82) -- Room and Board + ( Median Meal Plan Times 30 weeks )
                        FROM   rbrcomp
                        WHERE  rbrcomp_aidy_code = '1718'
                        AND    rbrcomp_btyp_code = 'CAMP'
                        AND    rbrcomp_aprd_code = 'FA/SPR'
                        AND    regexp_like(rbrcomp_bgrp_code,
                                           CASE nvl(( SELECT DISTINCT decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                      FROM   rcrapp1
                                                      WHERE  rcrapp1_pidm = spriden_pidm
                                                      AND    rcrapp1_aidy_code = '1718'
                                                      AND   (rcrapp1_curr_rec_ind = 'Y' OR rcrapp1_curr_rec_ind IS NULL)
                                                    ),'-1')
                                           WHEN '1' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '2' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '3' THEN '^(NONRES|RESID|GNNR)'
                                                    ELSE '^(NONRES|RESID|GNNR)' END)
                        AND    rbrcomp_comp_code = 'R+B'
                      ) AS room_and_board,
                      (
                        SELECT avg(rbrcomp_amt)
                        FROM   rbrcomp
                        WHERE  rbrcomp_aidy_code = '1718'
                        AND    rbrcomp_btyp_code = 'CAMP'
                        AND    rbrcomp_aprd_code = 'FA/SPR'
                        AND    regexp_like(rbrcomp_bgrp_code,
                                           CASE nvl(( SELECT DISTINCT decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                      FROM   rcrapp1
                                                      WHERE  rcrapp1_pidm = spriden_pidm
                                                      AND    rcrapp1_aidy_code = '1718'
                                                      AND   (rcrapp1_curr_rec_ind = 'Y' OR rcrapp1_curr_rec_ind IS NULL)
                                                    ),'-1')
                                           WHEN '1' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '2' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '3' THEN '^(NONRES|RESID|GNNR)'
                                                    ELSE '^(NONRES|RESID|GNNR)' END)
                        AND    rbrcomp_comp_code = 'TRAN'
                      ) AS transportation,
                      (
                        SELECT avg(rbrcomp_amt)
                        FROM   rbrcomp
                        WHERE  rbrcomp_aidy_code = '1718'
                        AND    rbrcomp_btyp_code = 'CAMP'
                        AND    rbrcomp_aprd_code = 'FA/SPR'
                        AND    regexp_like(rbrcomp_bgrp_code,
                                           CASE nvl(( SELECT DISTINCT decode(rcrapp1_inst_hous_cde, '1', '2', '2', '3', '3', '1', '-1')
                                                      FROM   rcrapp1
                                                      WHERE  rcrapp1_pidm = spriden_pidm
                                                      AND    rcrapp1_aidy_code = '1718'
                                                      AND   (rcrapp1_curr_rec_ind = 'Y' OR rcrapp1_curr_rec_ind IS NULL)
                                                    ),'-1')
                                           WHEN '1' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '2' THEN '^(COMRES|COMNR|GNCOM)'
                                           WHEN '3' THEN '^(NONRES|RESID|GNNR)'
                                                    ELSE '^(NONRES|RESID|GNNR)' END)
                        AND    rbrcomp_comp_code = 'PERS'
                      ) AS computer_and_tech,
                      0 AS all_other,
                      'calculated_in_outer_query' AS budget_total,
                      CASE WHEN EXISTS
                                (
                                  SELECT 'Y'
                                  FROM   rorsapr
                                  WHERE  rorsapr_pidm = spriden_pidm
                                  AND    rorsapr_term_code IN ('201730','201740','201820')
                                  AND    rorsapr_sapr_code LIKE 'P%'
                                ) THEN 1 ELSE 0 END
                      AS financial_aid_warning, -- RORSAPR (table) rorsapr_term_code (term) rorsapr_sapr_code like P% = probation and S% = ineligibility
                      CASE WHEN EXISTS
                                (
                                  SELECT 'Y'
                                  FROM   rorsapr
                                  WHERE  rorsapr_pidm = spriden_pidm
                                  AND    rorsapr_term_code IN ('201730','201740','201820')
                                  AND    rorsapr_sapr_code LIKE 'P%'
                                ) THEN 1 ELSE 0 END
                      AS financial_aid_probation, -- warning = probation at DSU
                      CASE WHEN EXISTS
                                (
                                  SELECT 'Y'
                                  FROM   rorsapr
                                  WHERE  rorsapr_pidm = spriden_pidm
                                  AND    rorsapr_term_code IN ('201730','201740','201820')
                                  AND    rorsapr_sapr_code LIKE 'S%'
                                ) THEN 1 ELSE 0 END
                      AS financial_aid_ineligibility,
                      CASE WHEN EXISTS
                      (
                        SELECT 'Y'
                        FROM   rpratrm, rfrbase
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = rfrbase_fund_code
                        AND    rfrbase_fsrc_code = 'FDRL'
                        AND    rpratrm_orig_offer_amt > 0
                      ) THEN 1 ELSE 0 END
                      AS federal_elegibility,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = 'FPELL'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS pell_grant,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = 'DIRECT'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS direct,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = 'DUSUB'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS unsubsidized,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = 'DPLUS'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS plus,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rpratrm_fund_code = 'FPERK'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS perkins,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm       = spriden_pidm
                        AND    rpratrm_fund_code IN ('FSEOG', 'FSEOGS')
                        AND    rpratrm_period    IN ('201730','201740','201820')
                      ) AS seog,
                      (
                        SELECT sum(rpratrm_orig_offer_amt)
                        FROM   rpratrm
                        WHERE  rpratrm_pidm       = spriden_pidm
                        AND    rpratrm_fund_code IN ('FCWS', 'FCWSA')
                        AND    rpratrm_period    IN ('201730','201740','201820')
                      ) AS work_study,
                      '' -- this isn't a required item and likely requires a lot of additional work to obtain. Leaving blank due to time constraints
                      AS veteran,
                      (
                        SELECT rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code,'`') WITHIN GROUP (ORDER BY rfrbase_fund_code)),
                                                    '([^`]*)(`\1)+($|`)','\1\3'),'`')
                        FROM   rpratrm, rfrbase
                        WHERE  rpratrm_pidm = spriden_pidm
                        AND    rfrbase_fund_code = rpratrm_fund_code
                        AND    rpratrm_period IN ('201730','201740','201820')
                        AND    rfrbase_fsrc_code = 'STAT'
                      ) AS state_programs,
                      nvl((
                            SELECT count(distinct rfrbase_fund_code)
                            FROM   rpratrm, rfrbase
                            WHERE  rpratrm_pidm      = spriden_pidm
                            AND    rfrbase_fund_code = rpratrm_fund_code
                            AND    rfrbase_fsrc_code = 'STAT'
                            AND    rpratrm_period   IN ('201730','201740','201820')
                      ), 0) AS state_count,
                      (
                        SELECT rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code,'`') WITHIN GROUP (ORDER BY rfrbase_fund_code)),
                                                    '([^`]*)(`\1)+($|`)','\1\3'),'`')
                        FROM   rpratrm, rfrbase
                        WHERE  rpratrm_pidm = spriden_pidm
                        AND    rfrbase_fund_code = rpratrm_fund_code
                        AND    rpratrm_period IN ('201730','201740','201820')
                        AND    rfrbase_fsrc_code IN ('INST', 'PRES')
                      ) AS institution_programs,
                      nvl((
                            SELECT count(distinct rfrbase_fund_code)
                            FROM   rpratrm, rfrbase
                            WHERE  rpratrm_pidm       = spriden_pidm
                            AND    rfrbase_fund_code  = rpratrm_fund_code
                            AND    rfrbase_fsrc_code IN ('INST', 'PRES')
                            AND    rpratrm_period    IN ('201730','201740','201820')
                      ), 0) AS institution_count,
                      (
                        SELECT rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code,'`') WITHIN GROUP (ORDER BY rfrbase_fund_code)),
                                                    '([^`]*)(`\1)+($|`)','\1\3'),'`')
                        FROM   rpratrm, rfrbase
                        WHERE  rpratrm_pidm      = spriden_pidm
                        AND    rfrbase_fund_code = rpratrm_fund_code
                        AND    rfrbase_fsrc_code = 'PRIV'
                        AND    rpratrm_period   IN ('201730','201740','201820')
                      ) AS private_programs,
                      nvl((
                            SELECT count(distinct rfrbase_fund_code)
                            FROM   rpratrm, rfrbase
                            WHERE  rpratrm_pidm      = spriden_pidm
                            AND    rfrbase_fund_code = rpratrm_fund_code
                            AND    rfrbase_fsrc_code = 'PRIV'
                            AND    rpratrm_period   IN ('201730','201740','201820')
                      ), 0) AS private_count,
                      (
                        SELECT rtrim(REGEXP_REPLACE((LISTAGG(rfrbase_fund_code,'`') WITHIN GROUP (ORDER BY rfrbase_fund_code)),
                                                    '([^`]*)(`\1)+($|`)','\1\3'),'`')
                        FROM   rpratrm, rfrbase
                        WHERE  rpratrm_pidm       = spriden_pidm
                        AND    rfrbase_fund_code  = rpratrm_fund_code
                        AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
                        AND    rpratrm_period    IN ('201730','201740','201820')
                      ) AS other_programs,
                      nvl((
                            SELECT count(distinct rfrbase_fund_code)
                            FROM   rpratrm, rfrbase
                            WHERE  rpratrm_pidm       = spriden_pidm
                            AND    rfrbase_fund_code  = rpratrm_fund_code
                            AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
                            AND    rpratrm_period    IN ('201730','201740','201820')
                      ), 0) AS other_count,
                      row_number() OVER (PARTITION BY dsc_pidm ORDER BY dsc_term_code DESC) AS rn
               FROM   students03@dscir, spbpers, spriden
               WHERE  dsc_pidm = spbpers_pidm
               AND    dsc_pidm = spriden_pidm
               AND    s_entry_action <> 'HS'
               AND    dsc_term_code IN ('20173E','20174E','20182E')
               AND    spriden_change_ind IS NULL
               AND   (spbpers_confid_ind IS NULL OR spbpers_confid_ind <> 'Y')
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
               ORDER BY spriden_last_name,
                        spriden_first_name
             )
      )
      SELECT 1 AS file_spec_ver_num,
             '230171' AS institute_id,
             '=VLOOKUP([@[Student-ID]],Table19[#All],2,FALSE)' AS study_id,
             banner_id AS student_id,
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
             nvl(pell_grant,0),
             nvl(direct,0),
             unsubsidized,
             plus AS parent_plus,
             '' AS grad_plus,
             teach,
             perkins,
             seog,
             work_study,
             service_grant,
             veteran,
             -- State Aid
             state_aid,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_1
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_1_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = state_program_1
             ) AS state_program_1_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_1
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_1_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_2
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_2_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = state_program_2
             ) AS state_program_2_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_2
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_2_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_3
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_3_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = state_program_3
             ) AS state_program_3_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = state_program_3
               AND    rfrbase_fsrc_code = 'STAT'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS state_program_3_amount,
             -- Institution Aid
             institution_aid,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_1
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_1_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = institution_program_1
             ) AS institution_program_1_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_1
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_1_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_2
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_2_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = institution_program_2
             ) AS institution_program_2_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_2
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_2_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_3
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_3_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = institution_program_3
             ) AS institution_program_3_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm       = pidm
               AND    rfrbase_fund_code  = rpratrm_fund_code
               AND    rpratrm_fund_code  = institution_program_3
               AND    rfrbase_fsrc_code IN ('INST', 'PRES')
               AND    rpratrm_period    IN ('201730','201740','201820')
             ) AS institution_program_3_amount,
             -- Private Aid
             private_aid,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_1
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_1_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = private_program_1
             ) AS private_program_1_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_1
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_1_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_2
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_2_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = private_program_2
             ) AS private_program_2_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_2
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_2_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_3
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_3_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = private_program_3
             ) AS private_program_3_type,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm      = pidm
               AND    rfrbase_fund_code = rpratrm_fund_code
               AND    rpratrm_fund_code = private_program_3
               AND    rfrbase_fsrc_code = 'PRIV'
               AND    rpratrm_period   IN ('201730','201740','201820')
             ) AS private_program_3_amount,
             -- Other aid
             other_aid,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_1
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_1_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = other_program_1
             ) AS other_program_1_type,
             CASE WHEN other_program_1 IS NOT NULL THEN 4 END AS other_program_1_source,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_1
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_1_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_2
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_2_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = other_program_2
             ) AS other_program_2_type,
             CASE WHEN other_program_2 IS NOT NULL THEN 4 END AS other_program_2_source,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_2
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_2_amount,
             (
               SELECT distinct rfrbase_fund_title
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_3
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_3_name,
             (
               SELECT np_fund_type
               FROM   npsas_fund_lookup
               WHERE  np_fund_code = other_program_3
             ) AS other_program_3_type,
             CASE WHEN other_program_3 IS NOT NULL THEN 4 END AS other_program_3_source,
             (
               SELECT SUM(rpratrm_orig_offer_amt)
               FROM   rpratrm, rfrbase
               WHERE  rpratrm_pidm           = pidm
               AND    rfrbase_fund_code      = rpratrm_fund_code
               AND    rpratrm_fund_code      = other_program_3
               AND    rfrbase_fsrc_code NOT IN ('STAT','INST','PRIV','FDRL','PRES')
               AND    rpratrm_period        IN ('201730','201740','201820')
             ) AS other_program_3_amount/**/
      FROM   student_list
      WHERE  rn = 1;

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
AND    rpratrm_period   IN ('201730','201740','201820');

-- end of file