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
(1, '2026-04-03 14:00:00', 10, 10, 1),
(1, '2026-04-03 18:00:00', 10, 10, 1),

-- Project Hail Mary
(2, '2026-04-03 15:00:00', 10, 10, 1),
(2, '2026-04-04 19:00:00', 10, 10, 1),

-- Interstellar
(3, '2026-04-03 16:00:00', 10, 10, 1),
(3, '2026-04-04 20:00:00', 10, 10, 1),

-- Inception
(4, '2026-04-03 13:00:00', 10, 10, 1),
(4, '2026-04-04 18:30:00', 10, 10, 1),

-- The Batman
(5, '2026-04-03 17:00:00', 10, 10, 1),
(5, '2026-04-04 21:00:00', 10, 10, 1),

-- Pushpa 2
(6, '2026-04-03 19:00:00', 10, 10, 1),
(6, '2026-04-04 22:00:00', 10, 10, 1),

-- 3 Idiots
(7, '2026-04-03 12:00:00', 10, 10, 1),
(7, '2026-04-04 17:30:00', 10, 10, 1);

CREATE TABLE Bookings (
    ID INT IDENTITY(1,1) PRIMARY KEY,
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
    U.UserId,
    M.MovieName,
    S.ShowTime,
    B.SeatsBooked
FROM Bookings B
JOIN UserDetails U ON B.UserId = U.Id
JOIN Shows S ON B.ShowId = S.Id
JOIN Movies M ON S.MovieId = M.Id;


SELECT * FROM Movies
SELECT * FROM UserDetails
SELECT * FROM Shows
SELECT * FROM Bookings

UPDATE Shows
SET 
    ShowTime = DATEADD(
        DAY,
        (ID % 7) + 1,
        CAST(CONVERT(date, GETDATE()) AS datetime)
    ) + 
    CAST(
        CASE (ID % 4)
            WHEN 0 THEN '12:00:00'
            WHEN 1 THEN '15:00:00'
            WHEN 2 THEN '18:00:00'
            ELSE '21:00:00'
        END AS datetime
    ),
    TotalSeats = 10,
    AvailableSeats = 10,
    IsActive = 1;

DELETE FROM Bookings;

--for fresh data testing
UPDATE Shows
SET 
    TotalSeats = 10,
    AvailableSeats = 10,
    IsActive = 1
