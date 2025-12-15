-- Temporary Table --

create temporary table Temp_Table
(First_name varchar(50),
Last_name varchar(50),
Favorite_movie varchar(100),
age int
);

select*
from temp_table;

insert into temp_table
values ("Shahd","Hani","To all boys i have loved before","22");

select*
from temp_table ;

create temporary table salary_over_50k
select*
from employee_salary
where salary>= 50000;

select*
from salary_over_50k;
