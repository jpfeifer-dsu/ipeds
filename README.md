# ipeds-npsas
### Step 1. Prep and Upload the 1st Submission File

Use the **PROD** DB
#### Run Script: 
* 01_ipeds-npsas-initial_submision.sql
Export as csv and submit to ipeds-npsas  

After submitting, NPSAS will send a sample of student data back to DSU to be analyzed
### Step 2. Insert Sampled Student Data into new table
Use the **DSCIR** DB 
* 02_ipeds-npsas-create-insert-sample-data.sql *(change the year of the table name)*
### Step 3. Update Parameters and Sample Student Data Table
Use the **PROD** DB
* 03_ipeds-npsas-create-insert-gi-enrl-data.sql
### Steps 4-6 Execute Queries and Generate CSV Files
Run the Return File Queries
* 04_ipeds-npsas-return-sample-general.sql
* 05_ipeds-npsas-return-sample-enrollment.sql
* 06_ipeds-npsas-return-sample-budget.sql  

Export results as a csv with **no headers**:  

Save files to: G:\Shared drives\Institutional Effectiveness\IPEDS\ipeds-npsas\npsas-20xx
### Step 7 Update NPSAS Fund Lookup Table
For the FA Aid file, you need to update the npsas_fund_lookup table by running the below script:
* 07_ipeds-npsas-fund-lookup-create.sql
### Step 8 Execute the FA Query and Generate a CSV File
* 08_ipeds-npsas-return-sample-fa.sql
Export results as a csv with **no headers**:

### Step 9 Review Data
Have FA review the Budget and FA files

Have the Director of Institutional Data Governance review the General Info and Enrollment Files

### Step 10 Submit CSV Files to IPEDS
Sign into the NPSAS Portal at https://surveys.nces.ed.gov/Portal/

You will want to choose CSV mode and then upload the files 

Fix any errors and repeat the process until all of the errors are gone

Review and submit to NPSAS




