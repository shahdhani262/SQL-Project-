select*
from employee_salary
WHERE SALARY > 50000 ;

select*
from employee_demographics
WHERE gender != "female" ;

-- AND OR NOT -- LOGICAL OPERATORS

select*
from employee_demographics
WHERE gender != "female" 
AND AGE > 36 ;

select*
from employee_demographics
WHERE gender = "female" 
or employee_id > 6 ;

-- LIKE STATEMENT --

select*
from employee_demographics
WHERE first_name like "DOn%" ; 

select*
from employee_demographics
WHERE first_name like "Je__%" 
; 





