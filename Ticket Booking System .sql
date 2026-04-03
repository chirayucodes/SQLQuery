CREATE DATABASE TicketBS 

CREATE TABLE UserDetails(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	
	[Name] VARCHAR(80) NOT NULL,
	
	UserId VARCHAR(50) NOT NULL UNIQUE,

	Password Varchar(30) NOT NULL 
);

SELECT * FROM UserDetails

INSERT INTO UserDetails (Name, UserId, Password)
VALUES 
('Chirayu Singh', 'chirayu10', 'user1'),
('Yash Parate', 'Yash10', 'user2'),
('Rishikesh Moon', 'Rishi10', 'user3'),
('Sarthak Singh', 'Sarthak10', 'user4');


CREATE TABLE Movies (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL
);

select *from Movies

INSERT INTO Movies (MovieName)
VALUES
('Dhurandhar: The Revenge'),
('Project Hail Mary'),
('Interstellar'),
('Inception'),
('The Batman'),
('Pushpa 2'),
('3 Idiots');

CREATE TABLE Shows (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    MovieId INT NOT NULL,
    ShowTime DATETIME NOT NULL,
    TotalSeats INT NOT NULL,
    AvailableSeats INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (MovieId) REFERENCES Movies(ID)
);

Select * from Shows