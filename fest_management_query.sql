-- Operations on the Fest Data

SELECT * FROM Fest;

SELECT Team_ID, Team_Name, Team_Type, Fest_ID, Created_At 
FROM Team ORDER BY Team_ID;

SELECT Member_ID, Member_Name, Supervisor_Member_ID, Team_ID, Date_of_Birth 
FROM Member ORDER BY Team_ID, Member_ID;