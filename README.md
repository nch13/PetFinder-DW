# Pet-Finder
Building a Data Warehouse to store homeless dog and cat data across ASEAN

# Context
Petfinder is a company that is collecting homeless dogs and cats from across ASEAN, feeding them temporarily until they move into a new home.
The raw data file is extracted from the system as a CSV. The sample is shown below.
![image](https://github.com/nch13/Pet-Finder/assets/140384066/28af8fe1-6f26-4d78-bf07-cb05084a975d)
We need to create a data pipeline from this csv file and put all the data into the data warehouse!

# Data Pipeline tools
Flat File Source: CSV | ETL: SQL Server Integration Services (SSIS) on Visual Studio | Database: Microsoft SQL server
![image](https://github.com/nch13/Pet-Finder/assets/140384066/75aab4d3-2d00-4808-8ff4-d218c7115f1e)

# ERD Diagram
I use Star Schema to represent relationships between entities in ERD
![image](https://github.com/nch13/Pet-Finder/assets/140384066/23b2cc92-7485-4035-8e34-5f675f90e626)

# ETL
Initial Load:
For the first time uploading data after created all the necessary tables.
![image](https://github.com/nch13/Pet-Finder/assets/140384066/f34f6094-eab1-4147-89d5-a3df61fb084e)

Incremental Load:
Full Load takes a lot of time and reduces sync performance. Therefore, design an Incremental Data Load help me solve this problem. By this way,when I know what the old data is, I need to decide whether to keep the history of the data or not.
![image](https://github.com/nch13/Pet-Finder/assets/140384066/b261af9e-ffeb-438a-965d-6858948a4f90)

# Data Warehouse
All data has been put into an archive, where we can use it to perform business queries, or visualization. Below is FACT table
![image](https://github.com/nch13/Pet-Finder/assets/140384066/11c98a17-35d8-43c4-ac0d-1a30347b6bfe)
