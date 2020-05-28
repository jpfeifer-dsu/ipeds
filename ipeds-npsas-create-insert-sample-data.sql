-- drop table ipeds_npsas_sample_data_2020;

create table ipeds_npsas_sample_data_2020 (
    institute_id varchar2(6),
    study_id varchar2(10),
    student_id varchar2(6),
    first_name varchar2(50),
    middle_name varchar2(50),
    last_name varchar2(50),
    suffix varchar2(10),
    ssn varchar2(20),
    dob varchar2(20)
);

/*
 **** STOP *****
 Save the file as a csv.  Clean up empty rows and columns and import to ipeds_npsas_sample_data_20xx using datagrip
 by right clicking on the table and choosing import
 */

select *
from ipeds_npsas_sample_data_2020;


-- truncate table ipeds_npsas_sample_data_2020;



--once created, import data from the return sample file received from NPSAS
