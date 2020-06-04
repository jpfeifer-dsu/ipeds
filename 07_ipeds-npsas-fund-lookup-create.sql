-- CREATE TABLE npsas_fund_lookup (np_fund_code VARCHAR2(8), np_fund_desc VARCHAR2(100), np_fund_type VARCHAR2(2));

truncate table npsas_fund_lookup;

insert into npsas_fund_lookup (np_fund_code, np_fund_desc, np_fund_type)

select distinct
       rpratrm_fund_code as np_fund_code,
       rfrbase_fund_title as np_fund_desc,
       case
           when rfrbase_ftyp_code = 'NEED' then '1'
           when rfrbase_ftyp_code = 'GENL' then '5'
           when rfrbase_ftyp_code = 'SCHL' then '2'
           when rfrbase_ftyp_code = 'LOAN' then '7'
           when rfrbase_ftyp_code = 'WORK' then '8'
           when rfrbase_ftyp_code = 'ATHL' then '9'
           when rfrbase_fund_code = 'CARES' then '20' --COVID(19)
           when rfrbase_ftyp_code = 'GRNT' then '5'
           else rfrbase_ftyp_code
       end as np_fund_type
from rpratrm,
     rfrbase
where rfrbase_fund_code = rpratrm_fund_code
  and rpratrm_aidy_code = :main_EB_AidYear;

commit;

select distinct *
from npsas_fund_lookup;

select distinct
    rpratrm_fund_code,
    rfrbase_fund_title,
    CASE
        WHEN rfrbase_ftyp_code = 'NEED' THEN '1'
        WHEN rfrbase_ftyp_code = 'GENL' THEN '5'
        WHEN rfrbase_ftyp_code = 'SCHL' THEN '2'
        WHEN rfrbase_ftyp_code = 'LOAN' THEN '7'
        WHEN rfrbase_ftyp_code = 'WORK' THEN '8'
        WHEN rfrbase_ftyp_code = 'ATHL' THEN '9'
        WHEN rfrbase_ftyp_code = 'GRNT' THEN '5'
        WHEN rfrbase_fund_code = 'CARES' THEN '20'
    ELSE rfrbase_ftyp_code end as npsas_fund_lookup
from rpratrm,
     rfrbase
where rfrbase_fund_code = rpratrm_fund_code
  and rpratrm_aidy_code = :main_EB_AidYear
  and rfrbase_fund_code = 'CARES';


