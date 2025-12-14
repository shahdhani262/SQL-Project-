-- sub queries --

select gender,avg(age),max(Age),min(age)
from employee_demographics
group by gender;

select gender, avg (max_age)
from
(select gender
,avg(age) as avg_age,
max(Age) as max_age,
min(age) as min_age
from employee_demographics
group by gender) as agg_table
group by gender;
