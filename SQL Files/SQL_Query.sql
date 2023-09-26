Use PetFinder
Go

-- 1. Có bao nhiêu mèo đã được tiêm phòng?
Select COUNT(*) as Number_Of_Vaccinated_Cat
From (
	Select PetID, TypeName, Vaccinated, Dewormed
	From PetFACT p JOIN TypeDIM t ON p.TypeKey = t.TypeKey
	Where TypeName = 'Cat') as tblTemp
JOIN MedicalStatusDIM m ON tblTemp.Vaccinated = m.MedicalStatusKey
Where MedicalStatus = 'Yes'
Go

-- 2. Cho biết loài, giới tính và độ tuổi các chú chó đực có tình trạng sức khoẻ tốt ở bang Kuala Lumpur
Select PetID, TypeName, Gender, Age, Health, StateName
From (
	Select t1.*, h.Health
	From (
			Select p.*, s.StateName From PetFACT p Join StateDIM s ON p.StateKey = s.StateKey
			Where StateName = 'Kuala Lumpur'
	) as t1
	JOIN HealthDIM h ON t1.HealthKey = h.HealthKey
	Where Health = 'Healthy') as t2
Join TypeDIM t ON t2.TypeKey = t.TypeKey
Join GenderDIM g ON t2.GenderKey = g.GenderKey
Where TypeName = 'Dog' AND Gender = 'Male'
Go

-- 3. Mỗi bang có bao nhiêu vật nuôi có tính phí nhận nuôi
Select StateDIM.StateKey, StateName, Number_Of_Pet
From (
	Select StateKey, Count(*) as Number_Of_Pet
	From PetFACT 
	Where Fee > 0
	Group by StateKey
	) as TblTemp
Join StateDIM ON TblTemp.StateKey = StateDIM.StateKey
Order By StateDIM.StateKey
Go

-- 4. Bao nhiêu vật nuôi chưa được tiêm phòng, tẩy giun và triệt sản?
Select Count(*) as Number_Of_Pet From PetFACT p, MedicalStatusDIM m
Where  m.MedicalStatusKey = p.Vaccinated
And  m.MedicalStatusKey = p.Dewormed
And  m.MedicalStatusKey = p.Sterilized
And MedicalStatus = 'No'
Go

-- 5. Thông tin về độ tuổi, phí nhận nuôi, người nhận nuôi của các giống chó thuần chủng tại bang Johor
Select PetID, TypeName, b1.Breed, b2.Breed, Age, Fee, RescuerID, StateName
From (
	Select * From PetFACT
	Where BreedKey1 IS NULL or BreedKey2 IS NULL or BreedKey1 = BreedKey2
	) as tt
Join TypeDIM t ON t.TypeKey = tt.TypeKey
Join StateDIM s ON s.StateKey = tt.StateKey
Left Join BreedDIM b1 ON b1.BreedKey = tt.BreedKey1
Left Join BreedDIM b2 ON b2.BreedKey = tt.BreedKey2
Where TypeName = 'Dog' and StateName = 'Johor'
Order by b1.Breed, b2.Breed
Go

Select * From [dbo].[StateDIM]
Select * From [dbo].[TypeDIM]
Select * From [dbo].[GenderDIM]
Select * From [dbo].[BreedDIM]
Select * From [dbo].[ColorDIM]
Select * From [dbo].[FurLengthDIM]
Select * From [dbo].[MaturitySizeDIM]
Select * From [dbo].[HealthDIM]
Select * From [dbo].[MedicalStatusDIM]
Select COUNT(*) From [dbo].[PetFACT]
where TypeKey = 2
Go