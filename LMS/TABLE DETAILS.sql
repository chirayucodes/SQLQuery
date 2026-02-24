CREATE DATABASE LMS

CREATE TABLE BookDetails(
	
	ID INT IDENTITY (1,1) PRIMARY KEY,
	BookTitle VARCHAR(100) NOT NULL,
	AuthorName VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL,

	BookPrice DECIMAL(6,2) NOT NULL,
	CategoryID INT,

	CONSTRAINT FK_BookDetails_Category
	FOREIGN KEY (CategoryID)
	REFERENCES Categories(ID)

);



CREATE TABLE Categories(

	ID INT IDENTITY(1,1) PRIMARY KEY,
	BookCategory VARCHAR(100) NOT NULL -- fiction/non-fiction

);


CREATE TABLE Members(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	
	MemberTypeID INT,

	CONSTRAINT FK_Members_MemberType
	FOREIGN KEY (MemberTypeID)
	REFERENCES MemberType(ID)
	
);

CREATE TABLE MemberType(
	ID INT IDENTITY(1,1) PRIMARY KEY,

	TypeName Varchar(20) NOT NULL,
	MaxBooks INT NOT NULL
);

CREATE TABLE BookIssueDetails(
	ID INT IDENTITY (1,1) PRIMARY KEY,

	BookID INT NOT NULL,
	MemberID INT NOT NULL,

	IssueDate DATE Default GETDATE(),
	RenewDate DATE NOT NULL,
	ReturnDate DATE NOT NULL,

	BookPrice Decimal(6,2) NOT NULL,
	CONSTRAINT FK_BookIssueDetails_BookDetails
	FOREIGN KEY (BookID)
	REFERENCES BookDetails(ID),

	CONSTRAINT FK_BookIssueDetails_Members
	FOREIGN KEY (MemberID)
	REFERENCES Members(ID)

);


SELECT* FROM BookDetails
SELECT* FROM Categories
SELECT* FROM Members
SELECT* FROM MemberType
SELECT* FROM BookIssueDetails


