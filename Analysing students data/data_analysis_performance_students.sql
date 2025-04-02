

-- Full table 
SELECT * FROM students;

-- 1.Average score in each subject.
SELECT 
    ROUND(AVG(mathscore)) avg_mathscore,
    ROUND(AVG(writingscore)) avg_writingscore,
    ROUND(AVG(readingscore)) avg_readingscore
FROM
    students
WHERE
    mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per student is: in mathematics 66 out of 100, in writing 68 out of 100 and finally, in reading 69 out of 100.




-- 2.How many students took the test preparation course? 
SELECT 
    testpreparationcourse,
    round(count(testpreparationcourse)/10,2) as course_percentage
FROM
    students
GROUP BY testpreparationcourse;
-- 64.0% of students did not take the exam preparation course, while 35.0% did.




-- 3.Is there a relationship between the student doing a test preparation course and the score in the exams?
SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from students
where testpreparationcourse IS NOT NULL
        AND testpreparationcourse = 'none'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject from a student who did not take the preparation course is 65 out of 100.

SELECT 
    ROUND(AVG(mathscore)),
    ROUND(AVG(writingscore)),
    ROUND(AVG(readingscore))
FROM
    students
WHERE
    testpreparationcourse IS NOT NULL
        AND testpreparationcourse = 'none'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per student who did not take the course is: in math 64 out of 100, in writing 65 out of 100 and finally, in reading 67 out of 100.

SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from students
where testpreparationcourse IS NOT NULL
        AND testpreparationcourse = 'completed'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject from a student who took the preparation course is 73 out of 100.

SELECT 
    ROUND(AVG(mathscore)),
    ROUND(AVG(writingscore)),
    ROUND(AVG(readingscore))
FROM
    students
WHERE
    testpreparationcourse IS NOT NULL
        AND testpreparationcourse = 'completed'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per student who took the course is: in math 70 out of 100, in writing 74 out of 100 and finally, in reading 74 out of 100.

-- 4.Number of students by gender.
SELECT 
    gender, COUNT(gender)
FROM
    students
GROUP BY gender
HAVING gender IS NOT NULL;
-- There are 518 female and 482 male students.

-- 5.Average score by gender.
SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from students
where gender = "female"
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject for a female student is 70 out of 100. 

SELECT round(avg((mathscore+writingscore+readingscore)/3)) as avg_total_score
from students
where gender = "male"
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per subject for a male student is 66 out of 100.

-- 6.Average score per subject by gender. 
SELECT 
    ROUND(AVG(mathscore)) as avg_math,
    ROUND(AVG(writingscore)) as avg_writing,
    ROUND(AVG(readingscore)) as avg_reading
FROM
    students
WHERE
    gender IS NOT NULL
        AND gender = 'female'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per female student is: in math 64 out of 100, in writing 72 out of 100 and finally, in reading 73 out of 100.

SELECT 
    ROUND(AVG(mathscore)) as avg_math,
    ROUND(AVG(writingscore)) as avg_writing,
    ROUND(AVG(readingscore)) as avg_reading
FROM
    students
WHERE
    gender IS NOT NULL
        AND gender = 'male'
        AND mathscore IS NOT NULL
        AND writingscore IS NOT NULL
        AND readingscore IS NOT NULL;
-- The average score per male student is: in math 69 out of 100, in writing 63 out of 100 and finally, in reading 65 out of 100.

-- 7.Student with the highest total score.
SELECT 
    (mathscore + writingscore + readingscore) AS total_score
FROM
    students
ORDER BY total_score DESC; 
-- The students with the highest total score are three, they also have a perfect score in all the exams. students with id: 101, 812 and 941.





-- 8.Student with the lowest total score.
SELECT 
    (mathscore + writingscore + readingscore) AS total_score
FROM
    students
ORDER BY total_score ASC; 
-- The student with the lowest total score in the exams is the student id: 60.




-- 9.What role did `race/ethnicity` and educational level from their parents play?

SELECT 
    `race/`race/ethnicity``, parentallevelofeducation
FROM
    students
ORDER BY `race/`race/ethnicity`` ASC;

SELECT 
    `race/`race/ethnicity``, COUNT(`race/`race/ethnicity``) AS count_students
FROM
    students
GROUP BY `race/`race/ethnicity``
ORDER BY `race/`race/ethnicity`` ASC; 
-- The group with most amount of students is the C with 319. 
-- The group with less amount of students is the A with 89. 

SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
GROUP BY parentallevelofeducation;
-- Most of parents' education is some college.
-- The least amount of education they have is a master's degree.

SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
WHERE
    `race/`race/ethnicity`` = 'group A'
GROUP BY parentallevelofeducation;
-- Most parents' education in group A is some high school.
-- Most parents' least amount of education in group A is a master degree.

SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
WHERE
    `race/`race/ethnicity`` = 'group B'
GROUP BY parentallevelofeducation;
-- Most parents' education in group B is high school.
-- Most parents' least amount of education in group B is a master degree.


SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
WHERE
    `race/`race/ethnicity`` = 'group C'
GROUP BY parentallevelofeducation;
-- Most parents' education in group C is associate degree.
-- Most parents' least amount of education in group C is a master degree.

SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
WHERE
    `race/ethnicity` = 'group D'
GROUP BY parentallevelofeducation;
-- Most parents' education in group D is some college.
-- Most parents' least amount of education in group D is a master degree.

SELECT 
    parentallevelofeducation, COUNT(parentallevelofeducation)
FROM
    students
WHERE
    `race/ethnicity` = 'group E'
GROUP BY parentallevelofeducation;
-- Most parents' education in group E is associate degree.
-- Most parents' least amount of education in group E is a master degree.

-- The least obtained level of parental education is a master degree, regardless of `race/ethnicity` group.

-- 10.How do `race/ethnicity` and lunch behave?
SELECT 
    lunch, COUNT(lunch)
FROM
    students
GROUP BY lunch;
-- Most students access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    `race/ethnicity` = 'group A'
GROUP BY lunch;
-- Most students in group A access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    `race/ethnicity` = 'group B'
GROUP BY lunch;
-- Most students in group B access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    `race/ethnicity` = 'group C'
GROUP BY lunch;
-- Most students in group C access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    `race/ethnicity` = 'group D'
GROUP BY lunch;
-- Most students in group D access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    `race/ethnicity` = 'group E'
GROUP BY lunch;
-- Most students in group E access the standard lunch.

-- Most students, regardless of their group, have access to the standard lunch.