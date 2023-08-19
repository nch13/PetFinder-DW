--Create Database PetFinder
--Go

Use PetFinder
Go

If exists (select * from sys.objects where name = 'PetFinder_Source')
	Drop table dbo.PetFinder_Source
Go

CREATE TABLE PetFinder_Source (
    PetID int not null primary key,
    Type varchar(3),
    Age int,
    Breed1 varchar(255),
    Breed2 varchar(255),
    Gender varchar(6),
    Color1 varchar(255),
    Color2 varchar(255),
    Color3 varchar(255),
    MaturitySize varchar(13),
    FurLength varchar(13),
    Vaccinated varchar(8),
    Dewormed varchar(8),
    Sterilized varchar(8),
    Health varchar(14),
    Quantity int,
    Fee int,
    State varchar(255),
    RescuerID int
);

-- Check sa has owner_sid permissions, if not then change db owner.
--IF (select SUSER_SNAME(owner_sid), * from sys.databases WHERE NAME='DEP_Asm1_Source') <> 'sa'
--BEGIN
--   EXEC sp_changedbowner 'sa'
--END
--GO
		
-- Check SourceDB is not already CDC enabled, if not then enable CDC for the database
if (select is_cdc_enabled, * from sys.databases WHERE NAME='PetFinder') = 'false'
BEGIN
   EXEC sys.sp_cdc_enable_db
END
GO
 
-- Check dbo.customers is not already CDC enabled, if not then enable CDC for the table
if (select is_tracked_by_cdc, * from sys.tables WHERE SCHEMA_NAME(schema_id)='dbo' and  NAME = 'PetFinder_Source') = 'false'
BEGIN
EXEC sys.sp_cdc_enable_table
   @source_schema = N'dbo',
   @source_name   = N'PetFinder_Source',
   @role_name     = NULL,
   @supports_net_changes = 1
END
GO