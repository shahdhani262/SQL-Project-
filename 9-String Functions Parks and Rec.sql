-- string functions --

select first_name , length( first_name )
from employee_demographics
order by 2;

-- upper and lower --
select first_name , upper( first_name )
from employee_demographics;

select first_name , lower( first_name )
from employee_demographics;

-- trim --

select Rtrim("       sky      ");
select Ltrim("       sky      ");

-- Left , right and sub string --

select first_name , 
left(first_name,4),
Right(first_name,4),
substring(first_name,3,2)
from employee_demographics ;

-- replace--

select first_name , replace(first_name, "a", "z")
from employee_demographics ;

-- locate --

select first_name , locate ("an",first_name)
from employee_demographics ;

-- concat --

SELECT first_name, last_name,
CONCAT(first_name," ", last_name) AS full_name
FROM employee_demographics
;


