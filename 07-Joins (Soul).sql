-- Joins --
-- inner joins --

select employee_demographics.age,employee_demographics.gender, employee_salary.occupation
from employee_demographics 
inner join employee_salary
   on employee_demographics.employee_id=employee_salary.employee_id;
   
   select dem.age,dem.gender,sal.occupation
from employee_demographics as dem
inner join employee_salary as sal
   on employee_demographics.employee_id=employee_salary.employee_id;
 
   -- outer joins --
   
select*
from employee_demographics
right join employee_salary
   on employee_demographics.employee_id = employee_salary.employee_id
   ;
   
   -- Self joins --
   
select*
from employee_salary as sal1
join employee_salary as sal2
   on sal1.employee_id = sal2.employee_id;
   
   -- joining multiples tables tgh --
   
     select*
from employee_demographics 
inner join employee_salary 
on employee_demographics.employee_id=employee_salary.employee_id
inner join parks_departments
on employee_salary.employee_id=parks_departments.department_id
;

   
   
