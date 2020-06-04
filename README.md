# ipeds-npsas
Process: -- 1st Submission File

  Run against PROD:
	01_ipeds-npsas-initial_submision.sql
	
  After submitting NPSAS will send a sample of student data back to DSU to be analyzed
-- Sample Data Run against DSCIR: 02_ipeds-npsas-create-insert-sample-data.sql import sampled student data into table

  Run against PROD & update parameters and sampled student table
    03_ipeds-npsas-create-insert-gi-enrl-data.sql
	
  Run the Return File Queries and export results as a csv with no headers:
	04_ipeds-npsas-return-sample-general.sql
	05_ipeds-npsas-return-sample-enrollment.sql
	06_ipeds-npsas-return-sample-budget.sql
	
  For the FA Aid file, you need to update the npsas_fund_lookup by running the below script:
	07_ipeds-npsas-fund-lookup-create.sql
	
  Run the last return file for FA and export results as a csv with no headers:	
    08_ipeds-npsas-return-sample-fa.sql
	

-- 2nd Submission File to NPSAS
