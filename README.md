# Students-Performance-in-Exams-Data-Analysis-

<H2>Problem Statement:</H2>
We have students results for 3 subjects and we have to analyze & understand the factors that influence student performance. We can find insights about which factors are most strongly correlated with student success, and this information can be used to improve student outcomes. 

<H2>Data:</H2>
The data set includes information about student demographics and academic performance. The data set includes the following variables:<br>

Gender: the gender of the student<br>
Reading Score: the student's score on a reading test<br>
Math Score: the student's score on a math test<br>
Writing Score: the student's score on a writing test<br>
Lunch: the type of lunch the student received (free/reduced price or paid)<br>
Test Preparation Course: whether or not the student received test preparation support<br>
Parental Level of Education: education qualification of the Student's parent<br>
You can find more information about the dataset and access the data itself on the Kaggle website: https://www.kaggle.com/spscientist/students-performance-in-exams<br>

<H3>Data Wrangling - </H3>

#renaming column name with space or special characters in between<br>

column `math score` to `math_score`<br>
column `reading score` to `reading_score`<br>
column `writing score` to `writing_score`<br>
column `parental level of education` to `parents_education`<br>
column `race/ethnicity` to `race`<br>
column `test preparation course` to `course`<br>

Note - here we have to use Backtick (`) and not (') Single quotation marks.<br>

#Updated values<br>

In Column Lunch, updated value "free/reduced" to "discounted"<br>

In Column parents_education, updated value "some high school" to "high school"<br>

<H3>Data Cleaning - </H3>

Checked for Null Values = 0<br>
Deleted un-necessary Column = "race"<br>

<H3>New Columns/Variables -</H3>

Math_Status: If math_score < 33 then Fail else Pass<br>
Reading_Status: If reading_score < 33 then Fail else Pass<br>
Writing_Status: If writing_score < 33 then Fail else Pass<br>
Result: If a student has Passed in all 3 subject's then Pass else Fail<br>
Maths_Grade: Provided grade to students based on math_Score<br>
Reading_Grade: Provided grade to students based on reading_Score<br>
Writing_Grade: Provided grade to students based on writing_Score<br>

<H4>Grade Criteria - For all subjects</H4>

Grade A: If score >= 80<br>
Grade B: If score < 80<br>
Grade C: If score < 70<br>
Grade D: If score < 60<br>
Grade E: If score < 50<br>
Grade F: If score < 33<br>


<H2>Approach:</H2>

1. To analyze the student performance data, I decided to use a combination of SQL and Excel. <br>
2. First, used SQL to clean and preprocess the data, including handling missing values and creating new variables. <br>
3. Next, used SQL & Excel to create a set of summary statistics and visualizations to better understand the data. <br>
4. Created a series of pivot tables to identify the factors that are most strongly correlated with student performance. <br>

<H2>Results/Insights:</H2>

After running the analysis, following insights were found:

1. Students who received test preparation support scored significantly higher on the reading, math, and writing tests<br>
2. Students who received "free/reduced" price lunch scored significantly lower on the reading, math, and writing tests<br>
3. Gender do not appear to be significant predictors of student performance<br>
4. Students who have Parental Education Level only of "High School" have more "Fail count" compared to others<br>

Find more details [visit here](https://www.linkedin.com/pulse/students-performance-exams-case-study-data-analysis-jainesh-rathod)
