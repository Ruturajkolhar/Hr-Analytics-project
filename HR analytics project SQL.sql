create database project;

use project;

-- KPIS
select count(EmployeeNumber) as Tot_Employees,sum(if(h1.Attrition="Yes",1,0)) as Tot_Attrition,round(avg(if(h1.Attrition="Yes",1,0))*100,2) as Attrition_rate,
count(EmployeeNumber)-sum(if(h1.Attrition="Yes",1,0)) as current_employees,sum(if(gender="Male",1,0)) as Tot_males,sum(if(gender="Male" and h1.Attrition="Yes",1,0)) as Tot_males_Attrition,
sum(if(gender="Female",1,0)) as Tot_females,sum(if(gender="Female" and h1.Attrition="Yes",1,0)) as Tot_females_Attrition from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID;



-- 1)   Average Attrition rate for all Departments --

select* From hr_1;
select* From hr_2;
select* from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID;

--   Main Query 
select h1.Department,concat(round(avg(if(h1.Attrition="Yes",1,0))*100,2),"%") as Attriction_Rate 
from hr_1  h1 inner join hr_2  h2 on h1.EmployeeNumber = h2.Employee_ID 
group by h1.Department;                






-- 2)  Average Hourly rate of Male Research Scientist

select JobRole,Gender, round(avg(HourlyRate),2) `avg working Hrs` from hr_1 h1 
inner join hr_2 h2 on h1.EmployeeNumber=h2.Employee_ID where JobRole="Research Scientist" and Gender ="Male"; 
     
     
     
     
     
     
-- 3)  Attrition rate Vs Monthly income stats



select department,round(sum(MonthlyIncome),0) as Tot_Monthly_income,
concat(round(avg(if(Attrition="Yes",1,0))*100,2),"%") as Attrition_Rate 
from hr_1 h1 inner join hr_2 h2 
on h1.EmployeeNumber=h2.Employee_ID group by department;









-- 4)  Average working years for each Department


select department,concat(round(avg(YearsInCurrentRole),2)," years") as `Avg working years` from hr_1  h1 
inner join hr_2  h2 on EmployeeNumber = Employee_ID group by department;    --   <-- Main Query





-- 5)  Job Role Vs Work life balance


--  Main Query
select JobRole,concat(round((sum(WorkLifeBalance)/(select sum(WorkLifeBalance) 
from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID))*100,2),"%") as "%_of_work_life_balance"
from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID group by JobRole;       --   <-- Main Query





select sum(WorkLifeBalance) from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID;






-- 6)  Attrition rate Vs Year since last promotion relation

select* from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID;
select JobRole,sum(YearsInCurrentRole) from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID group by JobRole;




-- 6)  Attrition rate Vs Year since last promotion relation

-- Main Query 
select JobRole,concat(round((sum(YearsSinceLastPromotion)/(select sum(YearsSinceLastPromotion) 
from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID))*100,2),"%") as `promotion_delay_in_%`,
concat(round(avg(if(Attrition="Yes",1,0))*100,2),"%") as `Attrition_rate`  
from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID group by JobRole;  





select sum(YearsSinceLastPromotion) from hr_1  h1 inner join hr_2  h2 on EmployeeNumber = Employee_ID;