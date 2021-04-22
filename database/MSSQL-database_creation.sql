CREATE SCHEMA System;
GO

CREATE SCHEMA Health;
GO

CREATE SCHEMA Relationship;
GO

CREATE TABLE System.users  
(  
    userID int NOT NULL,
	username nvarchar(50) NOT NULL,
	password nvarchar(50) NOT NULL,
	sex char(1) NOT NULL,
	email nvarchar
	CONSTRAINT PK_users_userID PRIMARY KEY CLUSTERED (userID)
);

CREATE TABLE Health.symptoms
(
	symptomID int NOT NULL,
	name nvarchar(100) NOT NULL,
	description nvarchar(500) NOT NULL,
	CONSTRAINT PK_symptoms_symptomID PRIMARY KEY CLUSTERED (symptomID)
);

CREATE TABLE Health.diseases
(
	diseaseID int NOT NULL,
	name nvarchar(100) NOT NULL,
	description nvarchar(500) NOT NULL,
	CONSTRAINT PK_diseases_diseaseID PRIMARY KEY CLUSTERED (diseaseID)
);

CREATE TABLE Health.treatments
(
	treatmentID int NOT NULL,
	name nvarchar(100) NOT NULL,
	description nvarchar(500) NOT NULL,
	CONSTRAINT PK_treatments_treatmentID PRIMARY KEY CLUSTERED (treatmentID)
);

CREATE TABLE Relationship.user_symptom (
	id int NOT NULL,
	userID int NOT NULL,
	symptomID int NOT NULL,
	CONSTRAINT PK_user_symptom_id PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_user_symptom_userID FOREIGN KEY (userID)
		REFERENCES System.users(userID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_user_symptom_symptomID FOREIGN KEY (symptomID)
		REFERENCES Health.symptoms(symptomID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Relationship.symptom_disease (
	id int NOT NULL,
	symptomID int NOT NULL,
	diseaseID int NOT NULL,
	CONSTRAINT PK_symptom_disease_id PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_symptom_disease_symptomID FOREIGN KEY (symptomID)
		REFERENCES Health.symptoms(symptomID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_symptom_disease_diseaseID FOREIGN KEY (diseaseID)
		REFERENCES Health.diseases(diseaseID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Relationship.disease_treatment (
	id int NOT NULL,
	diseaseID int NOT NULL,
	treatmentID int NOT NULL,
	CONSTRAINT PK_disease_treatment_id PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_disease_treatment_diseaseID FOREIGN KEY (diseaseID)
		REFERENCES Health.diseases(diseaseID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_disease_treatment_treatmentID FOREIGN KEY (treatmentID)
		REFERENCES Health.treatments(treatmentID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);