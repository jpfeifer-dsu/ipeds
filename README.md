# ipeds-npsas
### Step 1. Prep and Upload the 1st Submission File

Use the **PROD** Database
#### Run Script: 
* 01_ipeds-npsas-initial_submision.sql
After submitting, NPSAS will send a sample of student data back to DSU to be analyzed
### Step 2. Insert Sampled Student Data into new table
Use the **DSCIR** Database 
* 02_ipeds-npsas-create-insert-sample-data.sql *(change the year of the table name)*
### Step 3. Update Parameters and Sample Student Data Table
Use the **PROD**
* 03_ipeds-npsas-create-insert-gi-enrl-data.sql
### Steps 4-6 Execute Queries and Generate CSV Files
Run the Return File Queries
* 04_ipeds-npsas-return-sample-general.sql
* 05_ipeds-npsas-return-sample-enrollment.sql
* 06_ipeds-npsas-return-sample-budget.sql
Export results as a csv with **no headers**:
Export files to: G:\Shared drives\Institutional Effectiveness\IPEDS\ipeds-npsas\npsas-20xx
### Step 7 Update NPSAS Fund Lookup Table
For the FA Aid file, you need to update the npsas_fund_lookup by running the below script:
* 07_ipeds-npsas-fund-lookup-create.sql
### Step 8 Execute the FA Query and Generate a CSV File
* 08_ipeds-npsas-return-sample-fa.sql

Once done, before submitting, have FA review the Budget and FA files   
Have the IE director review the General Information and Enrollment files  

Once reviewed, submit to IPEDS-NPSAS via their website  




