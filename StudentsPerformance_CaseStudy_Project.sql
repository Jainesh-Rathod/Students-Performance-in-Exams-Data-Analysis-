create database student_performance;

use student_performance;

show tables;

select * from Students;

#Data Wrangling 

#changing values with special characters or merging similar values

update students
set lunch = "discounted"
where lunch = "free/reduced";

update students
set parents_education = "high school"
where parents_education = "some high school";


#renaming column name with space or special characters

alter table students
change column `math score` `math_score` int;

alter table students
change column `reading score` `reading_score` int;

alter table students
change column `writing score` `writing_score` int;

alter table students
change column `parental level of education` `parents_education` text;

alter table students
change column `race/ethnicity` `race` text;

alter table students
change column `test preparation course` `course` text;

#Data Cleaning

#finding null values in columns

select * 
from students 
where gender is NULL 
or race is NULL 
or parents_education is NULL 
or lunch is NULL 
or course is NULL 
or math_score is NULL 
or reading_score is NULL 
or writing_Score is NULL;

#deleting un-necessary column/s

alter table students
drop column race;

#finding the min, max, avg, count for math score, reading score & writing score

select min(math_score) as Maths_Min, min(reading_score) as Reading_Min, min(writing_score) as Writing_Min, 
max(math_score) as Maths_Max, max(reading_score) as Reading_Max, max(writing_score) as Writing_Max,
avg(math_score) as Maths_Avg, avg(reading_score) as Reading_Avg, avg(writing_score) as Writing_Avg
from students;

select * from students limit 5;

#checking if the Students have Passed or Failed and storing it as a view

create view status as
select *, 
		case 
			when math_score < 33 then 'Fail'
		else 'Pass'
        end as Math_Status,
        case 
			when reading_score < 33 then 'Fail'
		else 'Pass'
        end as Reading_Status,
        case 
			when writing_score < 33 then 'Fail'
		else 'Pass'
        end as Writing_Status,
        case 
			when math_score >= 33 AND reading_score >= 33 AND writing_score >= 33 then 'Pass'
		else 'Fail'
		end as Result,
        case when Math_score >= 80 then "Grade A"
		when Math_score < 80 then "Grade B"
		when Math_score < 70 then "Grade C"
		when Math_score < 60 then "Grade D"
		when Math_score < 50 then "Grade E"
		else "Grade F"
		end as Maths_Grade,
        case when Writing_score >= 80 then "Grade A"
		when Writing_score < 80 then "Grade B"
		when Writing_score < 70 then "Grade C"
		when Writing_score < 60 then "Grade D"
		when Writing_score < 50 then "Grade E"
		else "Grade F"
		end as Writing_Grade,
        case when Reading_score >= 80 then "Grade A"
		when Reading_score < 80 then "Grade B"
		when Reading_score < 70 then "Grade C"
		when Reading_score < 60 then "Grade D"
		when Reading_score < 50 then "Grade E"
		else "Grade F"
		end as Reading_Grade
from students
order by math_score, reading_score, writing_score;

select * from status;
drop view status;

#calculating the count of fails in each subject

select count(math_score) as Maths_Count
from status
where Math_Status = 'Fail';

select count(writing_score) as Writing_Count
from status
where Reading_Status = 'Fail';

select count(Reading_score) as Reading_Count
from status
where Writing_Status = 'Fail';

#calculating total pass:fail ratio

select
count(case when Math_status = 'Pass' then Math_status end) +
count(case when Writing_status = 'Pass' then Writing_status end) +
count(case when Reading_status = 'Pass' then Reading_status end) as Total_Pass, 
count(case when Math_status = 'Fail' then Math_status end) +
count(case when Writing_status = 'Fail' then Writing_status end) +
count(case when Reading_status = 'Fail' then Reading_status end) as Total_Fail
from status;

#calculating total pass:fail ratio w.r.t. gender

select gender,
count(case when Math_status = 'Pass' then Math_status end) +
count(case when Writing_status = 'Pass' then Writing_status end) +
count(case when Reading_status = 'Pass' then Reading_status end) as Total_Pass, 
count(case when Math_status = 'Fail' then Math_status end) +
count(case when Writing_status = 'Fail' then Writing_status end) +
count(case when Reading_status = 'Fail' then Reading_status end) as Total_Fail
from status
group by gender;

#calculating gender wise Pass:Fail ratio

select gender,
count(case when Math_status = 'Pass' then Math_status end) as Maths_Pass_Count,
count(case when Math_status = 'Fail' then Math_status end) as Maths_Fail_Count
from status
group by gender;

select gender,
count(case when Writing_status = 'Pass' then Writing_status end) as Writing_Pass_Count,
count(case when Writing_status = 'Fail' then Writing_status end) as Writing_Fail_Count
from status
group by gender;

select gender,
count(case when Reading_status = 'Pass' then Reading_status end) as Reading_Pass_Count,
count(case when Reading_status = 'Fail' then Reading_status end) as Reading_Fail_Count
from status
group by gender;

#calculating pass:fail ratio based on parents_education

select parents_education,
count(case when Math_status = 'Pass' then Math_status end) as Maths_Pass_Count,
count(case when Math_status = 'Fail' then Math_status end) as Maths_Fail_Count
from status
group by parents_education;

select parents_education,
count(case when Writing_status = 'Pass' then Writing_status end) as Writing_Pass_Count,
count(case when Writing_status = 'Fail' then Writing_status end) as Writing_Fail_Count
from status
group by parents_education;

select parents_education,
count(case when Reading_status = 'Pass' then Reading_status end) as Reading_Pass_Count,
count(case when Reading_status = 'Fail' then Reading_status end) as Reading_Fail_Count
from status
group by parents_education;

#calculating pass:fail ratio w.r.t course completion status

select course as Course_Support,
count(case when Math_status = 'Pass' then Math_status end) as Maths_Pass_Count,
count(case when Math_status = 'Fail' then Math_status end) as Maths_Fail_Count
from status
group by course;

select course as Course_Support,
count(case when Writing_status = 'Pass' then Writing_status end) as Writing_Pass_Count,
count(case when Writing_status = 'Fail' then Writing_status end) as Writing_Fail_Count
from status
group by course;

select course as Course_Support,
count(case when Reading_status = 'Pass' then Reading_status end) as Reading_Pass_Count,
count(case when Reading_status = 'Fail' then Reading_status end) as Reading_Fail_Count
from status
group by course;

#calculating students who passed in all subjects

select gender, result,count(*) as count, concat(round(count(*)*100/1000,0),'%') as percent from status
group by Result, gender;



