-- limit and Aliasing --
-- limit --
select *
from employee_demographics 
order by age desc
limit 4 ;

-- Aliasing --

select first_name as first 
from employee_demographics 
group by first_name;

select avg(salary) as salary_avg
from employee_salary
having salary_avg > 57000
;
