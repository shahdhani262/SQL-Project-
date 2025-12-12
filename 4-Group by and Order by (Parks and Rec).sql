-- group by --

select gender, avg(age), max( age),min(age),count(age)
from employee_demographics
group by gender ;

-- order by --

select*
from employee_demographics
order by first_name ;

select*
from employee_demographics
order by gender, age desc ;

select*
from employee_demographics
order by 5, 4 ;

