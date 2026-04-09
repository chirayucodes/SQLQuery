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

INSERT INTO Shows (MovieId, ShowTime, TotalSeats, AvailableSeats, IsActive)
VALUES
-- Dhurandhar: The Revenge
(1, '2026-04-03 14:00:00', 100, 100, 1),
(1, '2026-04-03 18:00:00', 100, 100, 1),

-- Project Hail Mary
(2, '2026-04-03 15:00:00', 80, 80, 1),
(2, '2026-04-04 19:00:00', 80, 80, 1),

-- Interstellar
(3, '2026-04-03 16:00:00', 120, 120, 1),
(3, '2026-04-04 20:00:00', 120, 120, 1),

-- Inception
(4, '2026-04-03 13:00:00', 90, 90, 1),
(4, '2026-04-04 18:30:00', 90, 90, 1),

-- The Batman
(5, '2026-04-03 17:00:00', 110, 110, 1),
(5, '2026-04-04 21:00:00', 110, 110, 1),

-- Pushpa 2
(6, '2026-04-03 19:00:00', 150, 150, 1),
(6, '2026-04-04 22:00:00', 150, 150, 1),

-- 3 Idiots
(7, '2026-04-03 12:00:00', 70, 70, 1),
(7, '2026-04-04 17:30:00', 70, 70, 1);

UPDATE Shows
SET TotalSeats = 10,
    AvailableSeats = 10;



CREATE TABLE Bookings (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    ShowId INT NOT NULL,
    SeatsBooked INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES UserDetails(ID),
    FOREIGN KEY (ShowId) REFERENCES Shows(ID)
);

select * from Bookings

INSERT INTO Bookings (UserId, ShowId, SeatsBooked)
VALUES
(1, 1, 2),
(1, 3, 4),
(2, 5, 1);

SELECT 
    B.Id AS BookingId,
    U.Name,
    U.UserID,
    M.MovieName,
    S.ShowTime,
    B.SeatsBooked
FROM Bookings B
JOIN UserDetails U ON B.UserId = U.ID
JOIN Shows S ON B.ShowId = S.Id
JOIN Movies M ON S.MovieId = M.Id;


SELECT* FROM UserDetails
SELECT* FROM Movies
SELECT* FROM Shows
SELECT* FROM Bookings

DELETE FROM Shows;
DBCC CHECKIDENT ('Shows', RESEED, 0);


DECLARE @Day INT = 0;
DECLARE @BaseDate DATE = CAST(GETDATE() AS DATE);

WHILE @Day < 10
BEGIN
    DECLARE @CurrentDate DATE = DATEADD(DAY, @Day, @BaseDate);

    -- 10 AM show
    INSERT INTO Shows (MovieId, ShowTime, TotalSeats, AvailableSeats, IsActive)
    SELECT 
        ID,
        DATEADD(HOUR, 10, CAST(@CurrentDate AS DATETIME)),
        10,
        10,
        1
    FROM Movies;

    -- 1 PM show
    INSERT INTO Shows (MovieId, ShowTime, TotalSeats, AvailableSeats, IsActive)
    SELECT 
        ID,
        DATEADD(HOUR, 13, CAST(@CurrentDate AS DATETIME)),
        10,
        10,
        1
    FROM Movies;

    -- 4 PM show
    INSERT INTO Shows (MovieId, ShowTime, TotalSeats, AvailableSeats, IsActive)
    SELECT 
        ID,
        DATEADD(HOUR, 16, CAST(@CurrentDate AS DATETIME)),
        10,
        10,
        1
    FROM Movies;

    -- 7 PM show
    INSERT INTO Shows (MovieId, ShowTime, TotalSeats, AvailableSeats, IsActive)
    SELECT 
        ID,
        DATEADD(HOUR, 19, CAST(@CurrentDate AS DATETIME)),
        10,
        10,
        1
    FROM Movies;

    SET @Day = @Day + 1;
END;