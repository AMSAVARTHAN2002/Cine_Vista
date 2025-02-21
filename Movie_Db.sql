create database Movie;
use movie;
Create table Users(
Userid int primary key,
User_name varchar(100),
Age int,
Mobile_number int,
Email_id varchar(100),
Gender varchar(12),
Location varchar(50)
);
Insert into Users (Userid,User_name,Age,Mobile_number,Email_id,Gender,Location) values
(1, 'Vasee', 25, 9843347088,'Thalavasee@gmail.com','Male', 'Chennai'),
(2, 'Loki', 23, 9345288528,'samanthaloki@gmail.com', 'Male', 'Coimbatore'),
(3, 'Amsa', 22, 9600643532,'Tvkamsa@gmaiil.com','Male', 'Madurai'),
(4, 'keerthi',21, 8678348483,'kerthi@gmail.com', 'Female', 'Trichy'),
(5, 'velu', 30, 9898438487,'Suriyavelu@gmail.com','Male', 'Salem');
alter table users modify Mobile_number bigint;
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(200),
    Genre VARCHAR(100),
    ReleaseYear INT,
    Rating DECIMAL(2,1)
);
INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, Rating) VALUES
(101, 'Jailer', 'Action, Drama', 2023, 8.5),
(102, 'Vikram', 'Action, Thriller', 2022, 8.4),
(103, 'Ponniyin Selvan: Part 1', 'Historical, Drama', 2022, 8.0),
(104, 'Leo', 'Action, Thriller', 2023, 7.9),
(105, 'Asuran', 'Drama, Action', 2019, 8.6),
(106, 'Super Deluxe', 'Drama, Thriller', 2019, 8.4),
(107, 'Kaithi', 'Action, Thriller', 2019, 8.5),
(108, 'Soorarai Pottru', 'Biography, Drama', 2020, 9.1),
(109, 'Karnan', 'Drama, Action', 2021, 8.2),
(110, '96', 'Romance, Drama', 2018, 8.6);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    ReviewText TEXT,
    Rating DECIMAL(2,1),
    ReviewDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(Userid),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
INSERT INTO Reviews (ReviewID, UserID, MovieID, ReviewText, Rating, ReviewDate) VALUES
(1, 1, 101, 'Superb mass entertainer! Rajini sir nailed it.', 9.0, '2024-01-05'),
(2, 2, 102, 'Kamal Haasan and Fahadh Faasil were brilliant!', 8.7, '2024-01-10'),
(3, 3, 104, 'One of the best Tamil movies ever made!', 8.5, '2024-01-12'),
(4, 4, 107, 'Edge-of-the-seat thriller. Karthi was amazing!', 8.8, '2024-01-15'),
(5, 5, 110, 'A beautiful love story with great music.', 8.5, '2024-01-20');

CREATE TABLE WatchHistory (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate DATE,
    Duration INT, -- Duration in minutes
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

INSERT INTO WatchHistory (HistoryID, UserID, MovieID, WatchDate, Duration) VALUES
(1, 1, 101, '2024-02-01', 165),
(2, 2, 102, '2024-02-02', 174),
(3, 3, 108, '2024-02-03', 153),
(4, 4, 107, '2024-02-04', 147),
(5, 5, 110, '2024-02-05', 158);
select * from watchhistory;
select * from movies;
