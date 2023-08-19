--Create Database PetFinder
--Go

Use PetFinder
Go
	
If exists (select * from sys.objects where name = 'PetFACT')
	Alter table dbo.PetFACT drop constraint
	FK1_State, FK2_Type, FK3_Gender, FK4_Breed1, FK5_Breed2, FK6_Color1, FK7_Color2, FK8_Color3,
	FK9_MaturitySize, FK10_FurLength, FK11_Health, FK12_Vaccinated, FK13_Dewormed, FK14_Sterilized;
	Drop table dbo.PetFACT
Go
If exists (select * from sys.objects where name = 'StateDIM')
	Drop table dbo.StateDIM
Go
If exists (select * from sys.objects where name = 'TypeDIM')
	Drop table dbo.TypeDIM
Go
If exists (select * from sys.objects where name = 'GenderDIM')
	Drop table dbo.GenderDIM
Go
If exists (select * from sys.objects where name = 'BreedDIM')
	Drop table dbo.BreedDIM
Go
If exists (select * from sys.objects where name = 'ColorDIM')
	Drop table dbo.ColorDIM
Go
If exists (select * from sys.objects where name = 'MaturitySizeDIM')
	Drop table dbo.MaturitySizeDIM
Go
If exists (select * from sys.objects where name = 'FurLengthDIM')
	Drop table dbo.FurLengthDIM
Go
If exists (select * from sys.objects where name = 'HealthDIM')
	Drop table dbo.HealthDIM
Go
If exists (select * from sys.objects where name = 'MedicalStatusDIM')
	Drop table dbo.MedicalStatusDIM
Go

Create Table StateDIM (
	StateKey tinyint not null identity(1,1),
	StateName varchar(255) not null,

	Constraint PK_State Primary Key (StateKey),
	Constraint UQ_StateName Unique (StateName)
);
Create Table TypeDIM (
	TypeKey tinyint not null identity(1,1),
	TypeName varchar(3)not null,

	Constraint PK_Type Primary Key (TypeKey),
	Constraint UQ_Type Unique (TypeName)
);
Create Table GenderDIM (
	GenderKey tinyint not null identity(1,1),
	Gender varchar(6) not null,

	Constraint PK_Gender Primary Key (GenderKey),
	Constraint UQ_Gender Unique (Gender)
);
Create Table BreedDIM (
	BreedKey tinyint not null identity(1,1),
	Breed varchar(255) not null,

	Constraint PK_Breed Primary Key (BreedKey),
	Constraint UQ_Breed Unique (Breed),
);
Create Table ColorDIM (
	ColorKey tinyint not null identity(1,1),
	Color varchar(255) not null,

	Constraint PK_Color Primary Key (ColorKey),
	Constraint UQ_Color Unique (Color)
);
Create Table MaturitySizeDIM (
	MaturitySizeKey tinyint not null identity(1,1),
	MaturitySize varchar(13) not null,

	Constraint PK_MaturitySize Primary Key (MaturitySizeKey),
	Constraint UQ_MaturitySize Unique (MaturitySize)
);
Create Table FurLengthDIM (
	FurLengthKey tinyint not null identity(1,1),
	FurLength varchar(13) not null,

	Constraint PK_FurLength Primary Key (FurLengthKey),
	Constraint UQ_FurLength Unique (FurLength)
);
Create Table HealthDIM (
	HealthKey tinyint not null identity(1,1),
	Health varchar(14) not null,

	Constraint PK_Health Primary Key (HealthKey),
	Constraint UQ_Health Unique (Health)
);
Create Table MedicalStatusDIM (
	MedicalStatusKey tinyint not null identity(1,1),
	MedicalStatus varchar(8) not null,

	Constraint PK_MedicalStatus Primary Key (MedicalStatusKey),
	Constraint UQ_MedicalStatus Unique (MedicalStatus)
);

Create Table PetFACT (
	PetKey int not null identity(1,1),
	PetID int not null,
	Quantity int,
	Age int,
	Fee int,
	RescuerID int,
	StateKey tinyint not null,
	TypeKey tinyint not null,
	GenderKey tinyint not null,
	BreedKey1 tinyint,
	BreedKey2 tinyint,
	ColorKey1 tinyint,
	ColorKey2 tinyint,
	ColorKey3 tinyint,
	MaturitySizeKey tinyint not null,
	FurLengthKey tinyint not null,
	HealthKey tinyint not null,
	Vaccinated tinyint not null,
	Dewormed tinyint not null,
	Sterilized tinyint not null,

	Constraint PK_PetDIM Primary Key (PetKey),
	Constraint UQ_PetDIM Unique (PetID),
	Constraint FK1_State Foreign Key (StateKey) References dbo.StateDIM (StateKey),
	Constraint FK2_Type Foreign Key (TypeKey) References dbo.TypeDIM (TypeKey),
	Constraint FK3_Gender Foreign Key (GenderKey) References dbo.GenderDIM (GenderKey),
	Constraint FK4_Breed1 Foreign Key (BreedKey1) References dbo.BreedDIM (BreedKey),
	Constraint FK5_Breed2 Foreign Key (BreedKey2) References dbo.BreedDIM (BreedKey),
	Constraint FK6_Color1 Foreign Key (ColorKey1) References dbo.ColorDIM (ColorKey),
	Constraint FK7_Color2 Foreign Key (ColorKey2) References dbo.ColorDIM (ColorKey),
	Constraint FK8_Color3 Foreign Key (ColorKey3) References dbo.ColorDIM (ColorKey),
	Constraint FK9_MaturitySize Foreign Key (MaturitySizeKey) References dbo.MaturitySizeDIM (MaturitySizeKey),
	Constraint FK10_FurLength Foreign Key (FurLengthKey) References dbo.FurLengthDIM (FurLengthKey),
	Constraint FK11_Health Foreign Key (HealthKey) References dbo.HealthDIM (HealthKey),
	Constraint FK12_Vaccinated Foreign Key (Vaccinated) References dbo.MedicalStatusDIM (MedicalStatusKey),
	Constraint FK13_Dewormed Foreign Key (Dewormed) References dbo.MedicalStatusDIM (MedicalStatusKey),
	Constraint FK14_Sterilized Foreign Key (Sterilized) References dbo.MedicalStatusDIM (MedicalStatusKey)
);
Go