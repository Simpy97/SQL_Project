
/***********************************************************************************************************
BDAT 1010: Business Intelligence
Assignment 3 - SQL: Part 2
By Group 09: Ruchika Gupta: 200559617
             Sandeep Kaur:  200544782
			 Jay Pravinbhai 
			 Patel:         200538084

**********************************************************************************************************/

-- Checking if the "Movies" database already exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Movies')
BEGIN
  -- Delete the existing "Movies" database
  ALTER DATABASE Movies SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE Movies;
END
GO
/**********************************************************************************************************/
--Q-1: Create the "Movies" database
CREATE DATABASE Movies;
GO

-- Use the "Movies" database
USE Movies;
GO

/**********************************************************************************************************/
--Q-2: Create the "mov" schema under “Movies”.
CREATE SCHEMA mov;
GO

/**********************************************************************************************************/
--Q-3: Create the "Movie_Director" table with all the given specifications
CREATE TABLE mov.Movie_Director (
  Director_ID INT IDENTITY(100, 10) PRIMARY KEY CLUSTERED NOT NULL,
  Director_First_Name VARCHAR(50),
  Director_Last_Name VARCHAR(50),
  Director_Age_in_Years INT,
  Director_Gender VARCHAR(20),
  CreatedOn DATE DEFAULT GETDATE() NOT NULL
);

-- Inserting records into the "Movie_Director" table
INSERT INTO mov.Movie_Director (Director_First_Name, Director_Last_Name, Director_Age_in_Years, Director_Gender)
VALUES
  ('Kevin', 'Smith', 52, 'Male'),
  ('Miguel', 'Arteta', 41, 'Male'),
  ('Mark', 'Johnson', 58, 'Male'),
  ('Tom', 'Vaughan', 37, 'Male'),
  ('Francis', 'Lawrence', 52, 'Male'),
  ('Adrienne', 'Shelly', 40, 'Female'),
  ('David', 'Slade', 53, 'Male'),
  ('Mark', 'Palansky', 53, 'Male'),
  ('Jeff', 'Lowell', 49, 'Male'),
  ('Simon', 'Curtis', 37, 'Male'),
  ('Marc', 'Lawrence', 95, 'Male'),
  ('Anand', 'Tucker', 59, 'Male'),
  ('Judd', 'Apatow', 55, 'Male'),
  ('Cary', 'Fukunaga', 45, 'Male'),
  ('Mark', 'Helfrich', 49, 'Male'),
  ('Nanette', 'Burstein', 52, 'Female'),
  ('James', 'McAvoy', 44, 'Male'),
  ('Mark', 'Waters', 58, 'Male'),
  ('Seth', 'Gordon', 46, 'Male'),
  ('Alex', 'Kendrick', 52, 'Male'),
  ('Kevin', 'Lima', 60, 'Male'),
  ('Lasse', 'Hallström', 76, 'Male'),
  ('Ewan', 'McGregor', 52, 'Male'),
  ('Rajkumar', 'Hirani', 60, 'Male'),
  ('Ashutosh', 'Gowariker', 59, 'Male'),
  ('Karan', 'Johar', 50, 'Male'),
  ('S.S', 'Rajamouli', 49, 'Male'),
  ('Sukumar', NULL, 53, 'Male'),
  ('Aditya', 'Chopra', 51, 'Male'),
  ('Umesh', 'Shukla', 52, 'Male');
GO

-- Displaying the inserted records from the "Movie_Director" table
SELECT * FROM mov.Movie_Director;
GO

/**********************************************************************************************************/
--Q-4: Create the "Movies" table with all the given specifications
CREATE TABLE mov.Movies (
  Movie_ID INT IDENTITY(1000, 1) PRIMARY KEY CLUSTERED NOT NULL,
  Movie_Name VARCHAR(100),
  Movie_Released_Year INT,
  Movie_Lead_Studio VARCHAR(100),
  Movie_Language VARCHAR(50),
  Movie_Category VARCHAR(50),
  Movie_Duration_in_Min INT,
  Movie_Worldwide_Earning_in_$M DECIMAL(15, 2),
  Movie_Type VARCHAR(50),
  Director_ID INT,
  CreatedOn DATE DEFAULT GETDATE() NOT NULL,
  FOREIGN KEY (Director_ID) REFERENCES mov.Movie_Director (Director_ID)
);

-- Inserting records into the "Movies" table
INSERT INTO mov.Movies (Movie_Name, Movie_Released_Year, Movie_Lead_Studio, Movie_Language, Movie_Category, Movie_Duration_in_Min, Movie_Worldwide_Earning_in_$M, Movie_Type, Director_ID)
VALUES
  ('Zack and Miri Make a Porno', 2008, 'The Weinstein Company', 'English', 'Romance', 101, 41.94, 'Hollywood', 100),
  ('Youth in Revolt', 2010, 'The Weinstein Company', 'English', 'Comedy', 90, 19.62, 'Hollywood', 110),
  ('When in Rome', 2010, 'Disney', 'English', 'Comedy', 91, 43.04, 'Hollywood', 120),
  ('What Happens in Vegas', 2008, 'Fox', 'English', 'Comedy', 99, 219.37, 'Hollywood', 130),
  ('Water For Elephants', 2011, '20th Century Fox', 'English', 'Drama', 120, 117.09, 'Hollywood', 140),
  ('Waitress', 2007, 'Independent', 'English', 'Romance', 108, 22.18, 'Hollywood', 150),
  ('Twilight', 2008, 'Summit', 'English', 'Romance', 122, 376.66, 'Hollywood', 160),
  ('Penelope', 2008, 'Summit', 'English', 'Comedy', 144, 20.74, 'Hollywood', 170),
  ('Over Her Dead Body', 2008, 'New Line', 'English', 'Comedy', 95, 20.71, 'Hollywood', 180),
  ('My Week with Marilyn', 2011, 'The Weinstein Company', 'English', 'Drama', 99, 8.26, 'Hollywood', 190),
  ('Music and Lyrics', 2007, 'Warner Bros.', 'English', 'Romance', 104, 145.9, 'Hollywood', 200),
  ('Leap Year', 2010, 'Universal', 'English', 'Comedy', 100, 32.59, 'Hollywood', 210),
  ('Knocked Up', 2007, 'Universal', 'English', 'Comedy', 129, 219, 'Hollywood', 220),
  ('Jane Eyre', 2011, 'Universal', 'English', 'Romance', 120, 30.15, 'Hollywood', 230),
  ('Good Luck Chuck', 2007, 'Lionsgate', 'English', 'Comedy', 101, 59.19, 'Hollywood', 240),
  ('Going the Distance', 2010, 'Warner Bros.', 'English', 'Comedy', 103, 42.05, 'Hollywood', 250),
  ('Gnomeo and Juliet', 2011, 'Disney', 'English', 'Animation', 84, 193.97, 'Hollywood', 260),
  ('Ghosts of Girlfriends Past', 2009, 'Warner Bros.', 'English', 'Comedy', 100, 102.22, 'Hollywood', 270),
  ('Four Christmases', 2008, 'Warner Bros.', 'English', 'Comedy', 88, 161.83, 'Hollywood', 280),
  ('Fireproof', 2008, 'Independent', 'English', 'Drama', 122, 33.47, 'Hollywood', 290),
  ('Enchanted', 2007, 'Disney', 'English', 'Comedy', 107, 340.49, 'Hollywood', 300),
  ('Dear John', 2010, 'Sony', 'English', 'Drama', 108, 114.97, 'Hollywood', 310),
  ('Beginners', 2011, 'Independent', 'English', 'Comedy', 105, 14.31, 'Hollywood', 320),
  ('3 Idiots', 2009, 'Vinod Chopra Films', 'Hindi', 'Comedy', 171, 4000, 'Bollywood', 330),
  ('Lagaan', 2001, 'Aamir Khan Productions', 'Hindi', 'Romance', 224, 659, 'Bollywood', 340),
  ('My Name Is Khan', 2010, 'Dharma Productions', 'Hindi', 'Drama', 165, 48.77, 'Bollywood', 350),
  ('Baahubali', 2015, 'Arka Media Works', 'Telugu', 'Thriller', 159, 6500, 'Bollywood', 360),
  ('Dilwale Dulhania Le Jayenge', 1995, 'Yash Chopra', 'Hindi', 'Romance', 189, 2000, 'Bollywood', 380),
  ('Oh My God', 2012, NULL, 'Hindi', 'Comedy', 165, 1200, 'Bollywood', 390),
  ('Pushpa', 2021, 'Mythri Movie Makers', 'Telugu', 'Drama', 179, 3730, 'Bollywood', 370);
GO

-- Displaying the inserted records from the "Movies" table
SELECT * FROM mov.Movies;
GO

/**********************************************************************************************************/
--Q-5: Create the "Movie_Actor" table with all the given specifications
CREATE TABLE mov.Movie_Actor (
  Actor_ID INT IDENTITY(10, 1) PRIMARY KEY CLUSTERED NOT NULL,
  Actor_First_Name VARCHAR(50),
  Actor_Last_Name VARCHAR(50),
  Actor_Age_in_Years INT,
  Actor_Location VARCHAR(50),
  Movie_ID INT,
  CreatedOn DATE DEFAULT GETDATE() NOT NULL,
  FOREIGN KEY (Movie_ID) REFERENCES mov.Movies (Movie_ID)
);

-- Inserting records into the "Movie_Actor" table
INSERT INTO mov.Movie_Actor (Actor_First_Name, Actor_Last_Name, Actor_Age_in_Years, Actor_Location, Movie_ID)
VALUES
  ('Seth', 'Rogen', 53, 'Los Angeles', 1000),
  ('Michael', 'Cera', 49, 'New York', 1001),
  ('Josh', 'Duhamel', 37, 'North Dakota', 1002),
  ('Jason', 'Sudeikis', 60, 'Kansas', 1003),
  ('Robert', 'Pattinson', 45, 'Los Angeles', 1004),
  ('Nathan', 'Fillion', 55, 'Canada', 1005),
  ('Robert', 'Pattinson', 45, 'Los Angeles', 1006),
  ('James', 'McAvoy', 49, 'Scotland', 1007),
  ('Paul', 'Rudd', 52, 'New York', 1008),
  ('Kenneth', 'Branagh', 44, 'Northern Ireland', 1009),
  ('Hugh', 'Grant', 58, 'London', 1010),
  ('Matthew', 'Goode', 46, 'England', 1011),
  ('Judd', 'Apatow', 58, 'Los Angeles', 1012),
  ('Michael', 'Fassbender', 46, 'Germany', 1013),
  ('Dane', 'Cook', 52, 'United States', 1014),
  ('Jason', 'Sudeikis', 60, 'Kansas', 1015),
  ('Kelly', 'Asbury', 76, 'United States', 1016),
  ('Matthew', 'McConaughey', 52, 'Los Angeles', 1017),
  ('Vince', 'Vaughn', 60, 'Minnesota', 1018),
  ('Kirk', 'Cameron', 59, 'United States', 1019),
  ('James', 'Marsden', 50, 'Columbia', 1020),
  ('Channing', 'Tatum', 58, 'Alabama', 1021),
  ('Mike', 'Mills', 37, 'New York', 1022),
  ('Aamir', 'Khan', 52, 'India', 1023),
  ('Aamir', 'Khan', 52, 'India', 1024),
  ('Shah Rukh', 'Khan', 53, 'India', 1025),
  ('Prabhas', NULL, 53, 'India', 1026),
  ('Allu', 'Arjun', 49, 'India', 1027),
  ('Shah Rukh', 'Khan', 53, 'India', 1028),
  ('Akshay', 'Kumar', 50, 'India', 1029);
GO

-- Displaying the inserted records from the "Movie_Actor" table
SELECT * FROM mov.Movie_Actor;
GO

/**********************************************************************************************************/
--Q-6: Create the "Movie_Rating" table with all the given specifications
CREATE TABLE mov.Movie_Rating (
  Movie_Rating_ID INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED NOT NULL,
  Rating_Audience_Score VARCHAR(10),
  Rating_Rotten_Tomatoes VARCHAR(10),
  Movie_ID INT,
  CreatedOn DATE DEFAULT GETDATE() NOT NULL,
  FOREIGN KEY (Movie_ID) REFERENCES mov.Movies (Movie_ID)
);

-- Inserting records into the "Movie_Rating" table
INSERT INTO mov.Movie_Rating (Rating_Audience_Score, Rating_Rotten_Tomatoes, Movie_ID)
VALUES
  ('70', '64', 1000),
  ('52', '68', 1001),
  ('44', '15', 1002),
  ('72', '28', 1003),
  ('72', '60', 1004),
  ('67', '89', 1005),
  ('82', '49', 1006),
  ('74', '52', 1007),
  ('47', '15', 1008),
  ('84', '83', 1009),
  ('70', '63', 1010),
  ('49', '21', 1011),
  ('83', '91', 1012),
  ('77', '85', 1013),
  ('61', '3', 1014),
  ('56', '53', 1015),
  ('52', '56', 1016),
  ('47', '27', 1017),
  ('52', '26', 1018),
  ('51', '40', 1019),
  ('80', '93', 1020),
  ('66', '29', 1021),
  ('80', '84', 1022),
  ('95', '100', 1023),
  ('81', '95', 1024),
  ('79', '83', 1025),
  ('80', '90', 1026),
  ('76', '82', 1027),
  ('85', '100', 1028),
  ('81', '74', 1029);
GO

-- Displaying the inserted records from the "Movie_Rating" table
SELECT * FROM mov.Movie_Rating;
GO

/**********************************************************************************************************/
--Q7 Write the following Query based on the above datasets

-- a List all the Movies information from the Movies table.
SELECT * FROM mov.Movies;

-- b. List all the Director information from the Director table.
SELECT * FROM mov.Movie_Director;

--c.List all the Actor information from the Actor table.
SELECT * FROM mov.Movie_Actor;

--d.List all the Rating information from the Rating table.
SELECT * FROM mov.Movie_Rating;

--e List all the movie released in year “2010”.
SELECT * FROM mov.Movies WHERE Movie_Released_Year = 2010;

--f List all the movie released by “The Weinstein Company” studio.
SELECT * FROM mov.Movies WHERE Movie_Lead_Studio = 'The Weinstein Company';

--g List all the movie released in “English”.
SELECT * FROM mov.Movies WHERE Movie_Language = 'English';

--h	List all the movie whose name starts with ‘G’.
SELECT * FROM mov.Movies WHERE Movie_Name LIKE 'G%';

--i	Display all the movie under “Comedy” category.
SELECT * FROM mov.Movies WHERE Movie_Category = 'Comedy';

--j	Display all the movie where movie type is “Hollywood”.
SELECT * FROM mov.Movies WHERE Movie_Type = 'Hollywood';

--k	Display all the “Female” directors.
SELECT * FROM mov.Movie_Director WHERE Director_Gender = 'Female';

--l	Display all the director whose Age is more than 45 years.
SELECT * FROM mov.Movie_Director WHERE Director_Age_in_Years > 45;

--m	Display all the Actors from “Los Angeles”.
SELECT * FROM mov.Movie_Actor WHERE Actor_Location = 'Los Angeles';

--n	Display all the Actor whose Age is less than 50 years.
SELECT * FROM mov.Movie_Actor WHERE Actor_Age_in_Years < 50;

--o	Display all the Actor whose name is starts from “J”.
SELECT * FROM mov.Movie_Actor WHERE Actor_First_Name LIKE 'J%';

--p	Display all the Actor who is from “Los Angeles” or “New York”.
SELECT * FROM mov.Movie_Actor WHERE Actor_Location IN ('Los Angeles', 'New York');

--q	List Director_FullName, Director_Age_in_Years, Director_Gender from Director
--[Director_FullName =Director_First_Name + " " + Director_Last_Name]
SELECT CONCAT(Director_First_Name, ' ', Director_Last_Name) AS Director_FullName, Director_Age_in_Years, Director_Gender FROM mov.Movie_Director;


--r	List Director_FullName, Director_Age_in_Years, Director_Gender from Director whose Age is less than 45 years. [Director_FullName =Director_First_Name + " " + Director_Last_Name] 
SELECT CONCAT(Director_First_Name, ' ', Director_Last_Name) AS Director_FullName, Director_Age_in_Years, Director_Gender FROM mov.Movie_Director WHERE Director_Age_in_Years < 45;


/**********************************************************************************************************/
--Q8 Write the following Query based on the above datasets.

--a	Display all the Movies and their Actors information based on the relationship.
SELECT M.*, A.*
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID;

--b	Display the Movies name and their Ratings.
SELECT M.Movie_Name, R.*
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID;


--c	Display all the Movies, Actors, and Directors information based on the relationship.
SELECT M.*, A.*, D.*
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID;


--d	Display all the Movies, Actors, Directors, and Movie Rating information based on the relationship.
SELECT M.*, A.*, D.*, R.*
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID;


--e	Display all the Movies, Actors, Directors, and Movie Rating information whose Rating_Audience_Score is more than 80% based on the relationship.
SELECT M.*, A.*, D.*, R.*
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
WHERE R.Rating_Audience_Score > '80';


--f	Display all the Movies information whose Rating_Rotten_Tomatoes is more than 90%.
SELECT M.*
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
WHERE R.Rating_Rotten_Tomatoes > '90';

/**********************************************************************************************************/
--Q9 Write the following Query based on the above datasets.

--a	Create new table MovieCopy and copy all records of Movie table.
SELECT *
INTO mov.MovieCopy
FROM mov.Movies;

--b	Create a new table DirectorCopy and copy only the schema of director table.
SELECT *
INTO mov.DirectorCopy
FROM mov.Movie_Director
WHERE 1 = 0;

--c	Create new table ActorCopy and copy all records of Actor table.
SELECT *
INTO mov.ActorCopy
FROM mov.Movie_Actor;

--d	Create new table RatingCopy and copy all records of Rating table.
SELECT *
INTO mov.RatingCopy
FROM mov.Movie_Rating;

--e	Create new table RatingCopies and copy only the schema from Rating table.
SELECT *
INTO mov.RatingCopies
FROM mov.Movie_Rating
WHERE 1 = 0;

/**********************************************************************************************************/
--Q10 Write the following Query based on the above datasets.

-- a. Delete all records from the RatingCopy table
DELETE FROM mov.RatingCopy;

-- b. Delete all movies from MovieCopy that were released in the year 2010
DELETE FROM mov.MovieCopy
WHERE Movie_Released_Year = 2010;

-- c. Delete all movies from MovieCopy where the language is 'Hindi'
DELETE FROM mov.MovieCopy
WHERE Movie_Language = 'Hindi';

-- d. Delete all movies from MovieCopy where Rating_Audience_Score is less than 80%
DELETE FROM mov.MovieCopy
WHERE Movie_ID IN (
  SELECT M.Movie_ID
  FROM mov.MovieCopy M
  JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
  WHERE R.Rating_Audience_Score < '80'
);

-- e. Delete all movies from MovieCopy where Rating_Rotten_Tomatoes is less than 70%
DELETE FROM mov.MovieCopy
WHERE Movie_ID IN (
  SELECT M.Movie_ID
  FROM mov.MovieCopy M
  JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
  WHERE R.Rating_Rotten_Tomatoes < '70'
);

/**********************************************************************************************************/
--Q11. Write the following Query based on the above datasets.

--a. Update the Rating_Audience_Score by 85% for the movie, released by “The Weinstein Company” studio.
UPDATE mov.Movie_Rating
SET Rating_Audience_Score = 85
WHERE Movie_ID IN (
  SELECT M.Movie_ID
  FROM mov.Movies M
  WHERE M.Movie_Lead_Studio = 'The Weinstein Company'
);
--verifying the result
/*SELECT M.Movie_Name, R.Rating_Audience_Score
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
WHERE M.Movie_Lead_Studio = 'The Weinstein Company';*/

/**********************************************************************************************************/
--b. Update the Rating_Rotten_Tomatoes by 75% for the movie, released in Year 2010.
UPDATE mov.Movie_Rating
SET Rating_Rotten_Tomatoes = 75
WHERE Movie_ID IN (
  SELECT M.Movie_ID
  FROM mov.Movies M
  WHERE M.Movie_Released_Year = 2010
);
--verifying the result
/*SELECT M.Movie_Name, R.Rating_Rotten_Tomatoes
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
WHERE M.Movie_Released_Year = 2010;*/

/**********************************************************************************************************/
--c. Increase the Actor Age by 2 years whose Name is “Michael Cera”.
UPDATE mov.Movie_Actor
SET Actor_Age_in_Years = Actor_Age_in_Years + 2
WHERE Actor_First_Name = 'Michael' AND Actor_Last_Name = 'Cera';

--verifying the result
/*SELECT Actor_First_Name, Actor_Last_Name, Actor_Age_in_Years
FROM mov.Movie_Actor
WHERE Actor_First_Name = 'Michael' AND Actor_Last_Name = 'Cera';*/

/**********************************************************************************************************/
--d. Increase the Director Age by 3 years who has directed the movie “Leap Year”.
UPDATE mov.Movie_Director
SET Director_Age_in_Years = Director_Age_in_Years + 3
WHERE Director_ID IN (
  SELECT M.Director_ID
  FROM mov.Movies M
  WHERE M.Movie_Name = 'Leap Year'
);
--verifying the result
/*SELECT M.Movie_Name, CONCAT(D.Director_First_Name, ' ', D.Director_Last_Name) AS Director_Name, D.Director_Age_in_Years
FROM mov.Movies M
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID
WHERE M.Movie_Name = 'Leap Year';*/

/**********************************************************************************************************/
--e. Increase the Director and Actor Age by 1 years who has directed the movie “Leap Lear" and released by “Universal” studio.
SELECT M.Director_ID, A.Movie_ID
INTO #MovieInfo -- Creating Temporary table MovieInfo
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
WHERE M.Movie_Name = 'Leap Year' AND M.Movie_Lead_Studio = 'Universal';

UPDATE mov.Movie_Director
SET Director_Age_in_Years = Director_Age_in_Years + 1
WHERE Director_ID IN (SELECT Director_ID FROM #MovieInfo);

UPDATE mov.Movie_Actor
SET Actor_Age_in_Years = Actor_Age_in_Years + 1
WHERE Movie_ID IN (SELECT Movie_ID FROM #MovieInfo);

DROP TABLE #MovieInfo;  -- Droping Temp table

--verifying the result
/*SELECT M.Movie_Name, CONCAT(D.Director_First_Name, ' ', D.Director_Last_Name) AS Director_Name, D.Director_Age_in_Years,
       CONCAT(A.Actor_First_Name, ' ', A.Actor_Last_Name) AS Actor_Name, A.Actor_Age_in_Years
FROM mov.Movies M
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
WHERE M.Movie_Name = 'Leap Year' AND M.Movie_Lead_Studio = 'Universal';*/


/**********************************************************************************************************/
--Q12. Write the following Query based on the above datasets.

--a. Create a view to display all the movie information’s.

IF OBJECT_ID('mov.v_MovieInfo', 'V') IS NOT NULL
  DROP VIEW mov.v_MovieInfo;     -- Drop the view if it already exists
GO
-- Create the view
CREATE VIEW mov.v_MovieInfo AS
SELECT Movie_ID, Movie_Name, Movie_Released_Year, Movie_Lead_Studio,
       Movie_Language, Movie_Category, Movie_Duration_in_Min,
       Movie_Worldwide_Earning_in_$M, Movie_Type
FROM mov.Movies;
GO

/*SELECT * FROM mov.v_MovieInfo;*/

/**********************************************************************************************************/
--b. Create a view to display all the movies and their rating information.

IF OBJECT_ID('mov.v_MovieRatingInfo', 'V') IS NOT NULL
  DROP VIEW mov.v_MovieRatingInfo;     -- Drop the view if it already exists
GO
-- Create the view
CREATE VIEW mov.v_MovieRatingInfo AS
SELECT M.Movie_ID, M.Movie_Name, M.Movie_Released_Year, M.Movie_Lead_Studio,
       M.Movie_Language, M.Movie_Category, M.Movie_Duration_in_Min,
       M.Movie_Worldwide_Earning_in_$M, M.Movie_Type,
       R.Rating_Audience_Score, R.Rating_Rotten_Tomatoes
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID;
;
GO

/*SELECT * FROM mov.v_MovieRatingInfo;*/

/**********************************************************************************************************/
--c. Create a view to display all the movies and their actor information.

IF OBJECT_ID('mov.v_MovieActorInfo', 'V') IS NOT NULL
  DROP VIEW mov.v_MovieActorInfo;      -- Drop the view if it already exists
GO
-- Create the view
CREATE VIEW mov.v_MovieActorInfo AS
SELECT M.Movie_ID, M.Movie_Name, M.Movie_Released_Year, M.Movie_Lead_Studio,
       M.Movie_Language, M.Movie_Category, M.Movie_Duration_in_Min,
       M.Movie_Worldwide_Earning_in_$M, M.Movie_Type,
       A.Actor_First_Name, A.Actor_Last_Name, A.Actor_Age_in_Years, A.Actor_Location
FROM mov.Movies M
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID;
GO

/*SELECT * FROM mov.v_MovieActorInfo;*/

/**********************************************************************************************************/
--d. Create a view to display all the movies, rating, actor along with director information.

IF OBJECT_ID('mov.v_MovieAllInfo', 'V') IS NOT NULL
  DROP VIEW mov.v_MovieInfo;     -- Drop the view if it already exists
GO
-- Create the view
CREATE VIEW mov.v_MovieAllInfo AS
SELECT M.Movie_ID, M.Movie_Name, M.Movie_Released_Year, M.Movie_Lead_Studio,
       M.Movie_Language, M.Movie_Category, M.Movie_Duration_in_Min,
       M.Movie_Worldwide_Earning_in_$M, M.Movie_Type,
       R.Rating_Audience_Score, R.Rating_Rotten_Tomatoes,
       A.Actor_First_Name, A.Actor_Last_Name, A.Actor_Age_in_Years, A.Actor_Location,
       D.Director_First_Name, D.Director_Last_Name, D.Director_Age_in_Years, D.Director_Gender
FROM mov.Movies M
JOIN mov.Movie_Rating R ON M.Movie_ID = R.Movie_ID
JOIN mov.Movie_Actor A ON M.Movie_ID = A.Movie_ID
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID;
GO

/*SELECT * FROM mov.v_MovieAllInfo;*/

/**********************************************************************************************************/
--e.Create a view to display all the information based on the result set returned by the query as shown below-
--	List movie, Director_FullName, Director_Age_in_Years, Director_Gender from Director
--	[Director_FullName =Director_First_Name + " " + Director_Last_Name]

IF OBJECT_ID('mov.v_MovieDirectorInfo', 'V') IS NOT NULL
  DROP VIEW mov.v_MovieDirectorInfo;    -- Drop the view if it already exists
GO
-- Create the view
CREATE VIEW mov.v_MovieDirectorInfo AS
SELECT M.Movie_Name, CONCAT(D.Director_First_Name, ' ', D.Director_Last_Name) AS Director_FullName, D.Director_Age_in_Years, D.Director_Gender
FROM mov.Movies M
JOIN mov.Movie_Director D ON M.Director_ID = D.Director_ID;
GO

/*SELECT * FROM mov.v_MovieDirectorInfo;*/


/**********************************************************************************************************/
--Q13. Write the following Query based on the above datasets.

--a. Retrieve the list of all Databases.

SELECT name AS DatabaseName
FROM sys.databases;

/**********************************************************************************************************/
--b. Display the byte size of all tables in databases.

SELECT 
    t.name AS TableName,
    SUM(s.used_page_count) * 8 AS ByteSize
FROM 
    sys.tables t
INNER JOIN      
    sys.dm_db_partition_stats s 
ON 
    t.object_id = s.object_id
WHERE 
    t.is_ms_shipped = 0 -- Excludes system tables
GROUP BY 
    t.name
ORDER BY 
    ByteSize DESC;


/**********************************************************************************************************/
--c. List of tables with number of records.

SELECT 
    t.name AS TableName,
    SUM(p.rows) AS NumberOfRecords
FROM 
    sys.tables t
INNER JOIN      
    sys.partitions p 
ON 
    t.object_id = p.object_id
WHERE 
    t.is_ms_shipped = 0 -- Excludes system tables
    AND p.index_id IN (0, 1) -- Include clustered index 
GROUP BY 
    t.name
ORDER BY 
    NumberOfRecords DESC;


/**********************************************************************************************************/
--d. List of Primary Key and Foreign Key for Whole Database.
SELECT 
    t.name AS TableName,
    pkcols.PrimaryKeys AS PrimaryKey,
    fkcols.ForeignKeys AS ForeignKey
FROM 
    sys.tables t
INNER JOIN (
    SELECT 
        t.name AS TableName,
        STRING_AGG(c.name, ', ') WITHIN GROUP (ORDER BY c.name) AS PrimaryKeys
    FROM 
        sys.tables t
    INNER JOIN 
        sys.key_constraints kc ON t.object_id = kc.parent_object_id
    INNER JOIN 
        sys.index_columns ic ON kc.parent_object_id = ic.object_id AND kc.unique_index_id = ic.index_id
    INNER JOIN 
        sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    WHERE 
        kc.type = 'PK'
    GROUP BY 
        t.name
) pkcols ON t.name = pkcols.TableName
INNER JOIN (
    SELECT 
        t.name AS TableName,
        STRING_AGG(c.name, ', ') WITHIN GROUP (ORDER BY c.name) AS ForeignKeys
    FROM 
        sys.tables t
    INNER JOIN 
        sys.foreign_keys fk ON t.object_id = fk.parent_object_id
    INNER JOIN 
        sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
    INNER JOIN 
        sys.columns c ON fkc.parent_object_id = c.object_id AND fkc.parent_column_id = c.column_id
    GROUP BY 
        t.name
) fkcols ON t.name = fkcols.TableName
WHERE 
    t.is_ms_shipped = 0 -- Excludes system tables
ORDER BY 
    t.name;


/**********************************************************************************************************/
--e. Get all Nullable columns of a table.
SELECT 
    t.name AS TableName,
    c.name AS NullableColumn
FROM 
    sys.tables t
INNER JOIN 
    sys.columns c ON t.object_id = c.object_id
WHERE 
    c.is_nullable = 1 -- 1 indicates that the column allows NULL values
ORDER BY 
    t.name, c.name;


/**********************************************************************************************************/
--f. Get All table that do not have primary key.

SELECT 
    t.name AS TableName
FROM 
    sys.tables t
LEFT JOIN 
    sys.key_constraints kc ON t.object_id = kc.parent_object_id AND kc.type = 'PK'
WHERE 
    kc.parent_object_id IS NULL
ORDER BY 
    t.name;

/**********************************************************************************************************/
--g. Get All table that do not have identity column.

SELECT 
    t.name AS TableName
FROM 
    sys.tables t
LEFT JOIN 
    sys.identity_columns ic ON t.object_id = ic.object_id
WHERE 
    ic.object_id IS NULL
ORDER BY 
    t.name;

/* Since there is no such table so it shows blank table*/

/**********************************************************************************************************/
--h. Get First Date of Current Month.

SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) AS FirstDateOfMonth;

/**********************************************************************************************************/
--i. Get Last date of Current month.

SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()), -1) AS LastDateOfMonth;

/**********************************************************************************************************/
--j. Get first date of next month.

SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()), 0) AS FirstDateOfNextMonth;

/**********************************************************************************************************/
--k. Get Last date of next month.

SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()) + 1, -1) AS LastDateOfNextMonth;

/**********************************************************************************************************/
--l. Get all the information from the tables.

DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = @sql + 'SELECT ''' + t.name + ''' AS TableName, * FROM ' + QUOTENAME(SCHEMA_NAME(t.schema_id)) + '.' + QUOTENAME(t.name) + ';'
FROM sys.tables t;

EXEC sp_executesql @sql;

/* getting all the information from the tables without hard coding the table name.*/

/**********************************************************************************************************/
--m. Get all columns contain any constraints.

SELECT 
    c.TABLE_NAME AS TableName,
    c.COLUMN_NAME AS ColumnName,
    CONSTRAINT_TYPE = 
        CASE 
            WHEN ccu.CONSTRAINT_NAME IS NOT NULL THEN 'Primary Key'
            WHEN tc.CONSTRAINT_NAME IS NOT NULL THEN 'Unique Key'
            WHEN KCU1.TABLE_NAME IS NOT NULL THEN 'Foreign Key'
            WHEN COLUMNPROPERTY(OBJECT_ID(c.TABLE_SCHEMA + '.' + c.TABLE_NAME), c.COLUMN_NAME, 'AllowsNull') = 0 THEN 'Not Null'
            ELSE NULL
        END
FROM 
    INFORMATION_SCHEMA.COLUMNS c
LEFT JOIN 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE ccu ON c.TABLE_NAME = ccu.TABLE_NAME AND c.COLUMN_NAME = ccu.COLUMN_NAME AND ccu.CONSTRAINT_NAME LIKE '%PK%'
LEFT JOIN 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc ON c.TABLE_NAME = tc.TABLE_NAME AND c.COLUMN_NAME = tc.CONSTRAINT_NAME AND tc.CONSTRAINT_TYPE = 'UNIQUE'
LEFT JOIN 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ctu ON c.TABLE_NAME = ctu.TABLE_NAME AND c.COLUMN_NAME = ctu.COLUMN_NAME
LEFT JOIN 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU1 ON ctu.CONSTRAINT_NAME = KCU1.CONSTRAINT_NAME AND c.COLUMN_NAME = KCU1.COLUMN_NAME
WHERE 
    ccu.CONSTRAINT_NAME IS NOT NULL OR tc.CONSTRAINT_NAME IS NOT NULL OR KCU1.TABLE_NAME IS NOT NULL OR COLUMNPROPERTY(OBJECT_ID(c.TABLE_SCHEMA + '.' + c.TABLE_NAME), c.COLUMN_NAME, 'AllowsNull') = 0;


/**********************************************************************************************************/
--n. Get all tables that contain a view.

SELECT DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE TABLE_NAME IS NOT NULL;

/**********************************************************************************************************/
--o. Get all columns of table that using in views.

SELECT v.name AS View_Name, c.name AS Column_Name
FROM sys.views v
INNER JOIN sys.sql_dependencies d ON v.object_id = d.object_id
INNER JOIN sys.columns c ON d.referenced_major_id = c.object_id
WHERE d.referenced_minor_id = c.column_id
ORDER BY v.name, c.column_id;

/********************************************************************************************************/
