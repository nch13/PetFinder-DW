# Pet-Finder
Building a Data Warehouse to store homeless dog and cat data across ASEAN

# Context
Petfinder is a company that is collecting homeless dogs and cats from across ASEAN, feeding them temporarily until they move into a new home.
The raw data file is extracted from the system as a CSV. The sample is shown below.
![Screenshot 2023-08-19 194356](https://github.com/nch13/PetFinder-DW/assets/140384066/a2d4e18d-b04f-4e7a-831d-2cc4c3df491d)

We need to create a data pipeline from this csv file and put all the data into the data warehouse!

# Data Pipeline tools
Flat File Source: CSV | ETL: SQL Server Integration Services (SSIS) on Visual Studio | Database: Microsoft SQL server
![Screenshot 2023-08-19 195102](https://github.com/nch13/PetFinder-DW/assets/140384066/87e7b2be-13e2-4590-a918-5e8ac22e8073)


# ERD Diagram
I use Star Schema to represent relationships between entities in ERD
![Screenshot 2023-08-19 195616](https://github.com/nch13/PetFinder-DW/assets/140384066/a349daad-be2b-4360-a4d8-7052fb531352)


# ETL
Initial Load:
For the first time uploading data after created all the necessary tables.
![Screenshot 2023-08-19 195936](https://github.com/nch13/PetFinder-DW/assets/140384066/93939387-9fc8-4a0f-8c24-a80c1381e9e4)


Incremental Load:
Full Load takes a lot of time and reduces sync performance. Therefore, design an Incremental Data Load help me solve this problem. By this way,when I know what the old data is, I need to decide whether to keep the history of the data or not.
![Screenshot 2023-08-19 201758](https://github.com/nch13/PetFinder-DW/assets/140384066/ff01345a-31db-4413-b292-6cdd04f82c1d)


# Data Warehouse
All data has been put into an archive, where we can use it to perform business queries, or visualization. Below is FACT table
![Screenshot 2023-08-19 202015](https://github.com/nch13/PetFinder-DW/assets/140384066/4062ce05-1689-42aa-b29a-9c08bee29bb1)
