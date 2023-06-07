DROP DATABASE IF EXISTS homeWork;

CREATE DATABASE homeWork;

USE homeWork;

CREATE TABLE Students (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(128) NOT NULL,
age INTEGER
);

CREATE TABLE Teachers (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(128) NOT NULL,
age INTEGER
);

CREATE TABLE Competencies (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(128) NOT NULL
);

CREATE TABLE Teachers2Competencies (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
teacher_id INTEGER,
competencies_id INTEGER
);

CREATE TABLE Courses (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
teacher_id INTEGER,
title VARCHAR(128) NOT NULL,
headman_id INTEGER
);

CREATE TABLE Students2Courses (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
student_id INTEGER,
course_id INTEGER
);

INSERT INTO Students (name, age) VALUES ('Анатолий', 29),
										('Олег', 25),
                                        ('Семен', 27),
                                        ('Олеся', 28),
                                        ('Ольга', 31),
                                        ('Иван', 22);
                                        
INSERT INTO Teachers (name, age) VALUES ('Петр', 39),
										('Максим', 35),
                                        ('Антон', 37),
                                        ('Всеволод', 38),
                                        ('Егор', 41),
                                        ('Светлана', 32);
                                        
INSERT INTO Competencies (title) VALUES ('Математика'),
										('Информатика'),
                                        ('Программирование'),
                                        ('Графика');
                                        
INSERT INTO Teachers2Competencies (teacher_id, competencies_id) VALUES (1, 1),
																  (2, 1),
                                                                  (2, 3),
                                                                  (3, 2),
                                                                  (4, 1),
                                                                  (5, 3);
								
INSERT INTO Courses (teacher_id, title, headman_id) VALUES (1, 'Алгебра логики', 2),
														   (2, 'Математическая статистика', 3),
														   (4, 'Высшая математика', 5),
														   (5, 'Javascript', 1),
														   (5, 'Базовый Python', 1);
                                                                 
INSERT INTO Students2Courses (student_id, course_id) VALUES (1, 1),
															(2, 1),
                                                            (3, 2),
                                                            (3, 3),
                                                            (4, 5);
                                                            
-- task1 --
SELECT
	t2.name,
    t3.title
FROM Students AS t2
JOIN Students2Courses AS t1 ON t2.id = t1.student_id
JOIN Courses AS t3 ON t3.id = t1.course_id;
-- task2 --
SELECT
	t2.name,
    t3.title
FROM Teachers AS t2
JOIN Teachers2Competencies AS t1 ON t2.id = t1.teacher_id
JOIN Competencies AS t3 ON t3.id = t1.competencies_id;
-- task3 --
SELECT
	*
FROM Teachers
WHERE id NOT IN (
SELECT teacher_id
FROM Teachers2Competencies
WHERE competencies_id IS NULL
);
-- task4 --
SELECT
	*
FROM Students
WHERE id NOT IN (
SELECT student_id
FROM Students2Courses
WHERE course_id IS NULL
);
-- task5 --
SELECT
	c.title
FROM Courses AS c
LEFT JOIN Students2Courses AS s2c ON c.id = s2c.course_id
WHERE s2c.course_id IS NULL;
-- task6 --
SELECT
	c.title
FROM Competencies AS c
LEFT JOIN Teachers2Competencies AS t2c ON c.id = t2c.competencies_id
WHERE t2c.competencies_id IS NULL;
-- task7 --
SELECT
	s.name,
    c.title
FROM Students AS s
JOIN Students2Courses AS s2c ON s2c.student_id = s.id
JOIN Courses AS c ON s2c.course_id = c.id
WHERE c.headman_id = s.id;
-- task8 --
SELECT
	s.name,
    h.name AS headman_name
FROM Students AS s
JOIN Students2Courses AS s2c ON s2c.student_id = s.id
JOIN Courses AS c ON s2c.course_id = c.id
JOIN Students AS h ON c.headman_id = h.id