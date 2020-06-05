# ipeds-npsas
### Step 1. Prep and Upload the 1st Submission File

##### Use the **PROD** Database
#### Run Script: 
* 01_ipeds-npsas-initial_submision.sql

#### After submitting NPSAS will send a sample of student data back to DSU to be analyzed
##### Use the **DSCIR** Database 
* 02_ipeds-npsas-create-insert-sample-data.sql *(imports sampled student data into table)*
##### Use the **PROD** Database update parameters and sampled student table that was just created
* 03_ipeds-npsas-create-insert-gi-enrl-data.sql
##### Run the Return File Queries and export results as a csv with **no headers**:
Export files to: G:\Shared drives\Institutional Effectiveness\IPEDS\ipeds-npsas\npsas-2020
* 04_ipeds-npsas-return-sample-general.sql
* 05_ipeds-npsas-return-sample-enrollment.sql
* 06_ipeds-npsas-return-sample-budget.sql
#### For the FA Aid file, you need to update the npsas_fund_lookup by running the below script:
* 07_ipeds-npsas-fund-lookup-create.sql
#### Run the last return file for FA
* 08_ipeds-npsas-return-sample-fa.sql
	

-- 2nd Submission File to NPSAS

