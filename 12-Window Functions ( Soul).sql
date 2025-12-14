-- window functions --

select employee_demographics.first_name,
employee_demographics.last_name,
employee_demographics.gender,
salary,
avg(salary) over(partition by gender)
from employee_demographics
join employee_salary
 on employee_demographics.employee_id = employee_salary.employee_id ;
 
 
select dem.first_name,
dem.last_name,
dem.gender,
salary,
sum(salary) over(partition by gender order by dem.employee_id)
 as rolling_table
from employee_demographics as dem
join employee_salary as sal
 on dem.employee_id = sal.employee_id; 
 
 select dem.first_name,dem.last_name,dem.gender,sal.salary,
Row_number() over(partition by gender order by salary desc) as row_num,
Rank () over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics as dem
join employee_salary as sal
 on dem.employee_id = sal.employee_id; 
