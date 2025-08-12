use school;
select* from classes;
select* from students;
select* from enrollments;
select* from teachers;
# Scalar subquery in SELECT
SELECT s.StudentID,s.Name,(SELECT COUNT(*)
FROM Enrollments e WHERE e.StudentID = s.StudentID) AS TotalClasses FROM 
Students s;
# Subquery in WHERE with IN
SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE ClassID = 1
);
# Correlated subquery with EXISTS
SELECT Name
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.StudentID = s.StudentID
);
#  Subquery in FROM (Derived table)
SELECT ClassName, TotalStudents
FROM (
    SELECT c.ClassName, COUNT(e.StudentID) AS TotalStudents
    FROM Classes c
    LEFT JOIN Enrollments e ON c.ClassID = e.ClassID
    GROUP BY c.ClassName
) AS ClassSummary;

# Correlated scalar subquery

SELECT s.StudentID, s.Name,
    (SELECT c.ClassName
     FROM Enrollments e
     JOIN Classes c ON e.ClassID = c.ClassID
     WHERE e.StudentID = s.StudentID
     ORDER BY e.EnrollmentDate DESC
     LIMIT 1) AS LastClass
FROM Students s;

# Multi-level subquery

SELECT Name
FROM Teachers
WHERE TeacherID = (
    SELECT TeacherID
    FROM Classes
    WHERE ClassID = (
        SELECT ClassID
        FROM Enrollments
        GROUP BY ClassID
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);

# Subquery in SELECT with Average

SELECT ClassName,
       (SELECT COUNT(*) 
        FROM Enrollments e 
        WHERE e.ClassID = c.ClassID) AS ClassCount,
       (SELECT AVG(StudentCount) 
        FROM (
            SELECT COUNT(*) AS StudentCount
            FROM Enrollments
            GROUP BY ClassID
        ) AS AvgTable) AS AvgClassSize
FROM Classes c;



