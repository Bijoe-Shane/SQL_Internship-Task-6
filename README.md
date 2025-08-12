SQL Internship – Task 6: Subqueries & Nested Queries

📌 Objective

This project demonstrates the use of different types of SQL subqueries (scalar, correlated, derived table, and multi-level) using a School / Student Management System database containing Students, Teachers, Classes, and Enrollments.

🛠️ Tools & Technologies

MySQL 8.x – Database Management System

MySQL Workbench – Database design & query execution

SQL – DDL, DML, and Subquery-based SELECT statements

📁 Database Structure
students

StudentID (INT, PK, AUTO_INCREMENT)

Name (VARCHAR)

DateOfBirth (DATE)

teachers

TeacherID (INT, PK, AUTO_INCREMENT)

Name (VARCHAR)

SubjectSpecialization (VARCHAR)

classes

ClassID (INT, PK, AUTO_INCREMENT)

ClassName (VARCHAR)

TeacherID (INT, FK → teachers.TeacherID)

enrollments

EnrollmentID (INT, PK, AUTO_INCREMENT)

StudentID (INT, FK → students.StudentID)

ClassID (INT, FK → classes.ClassID)

EnrollmentDate (DATE)

🔗 Relationships
teachers → classes: One teacher can teach many classes.

classes → enrollments: One class can have many students.

students → enrollments: One student can enroll in many classes (many-to-many via enrollments).

📊 Subquery Types Implemented

Scalar Subquery in SELECT – Total classes per student

Subquery in WHERE with IN – Students in a specific class

Correlated Subquery with EXISTS – Students with at least one enrollment

Subquery in FROM (Derived Table) – Total students per class

Correlated Scalar Subquery – Last enrolled class per student

Multi-level Subquery – Teacher of the largest class

Subquery in SELECT with AVG – Compare class size to average

📌 Deliverables

SQL script for creating and populating tables

SQL script for subquery examples (Task 6)

ER Diagram of the database

Query outputs

📌 Summary

Learned to use different SQL subqueries (scalar, correlated, derived, and multi-level) to get related data from multiple tables. Practiced making relationships, writing subqueries, and understanding their uses in a School Management System.
