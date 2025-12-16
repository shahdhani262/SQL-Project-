						    -- Data Cleaning --
                            
-- 1- Remove_Duplicates --
-- 2- Standarize the Data --
-- 3- Null Values or Blank Values --
-- 4- Remove Columns and Rows --

drop table layoffs_new;

select*
from layoffs ;

 Create TABLE Layoffs_n
          like  layoffs   ;

select*
from layoffs_N;

insert layoffs_n
select*
from layoffs;

                      -- 1- Remove_Duplicates --
                      
select*,
Row_NUMBER () OVER(partition by company,location,industry,total_laid_off,'DATE',stage,country,funds_raised_millions)
as row_num
from layoffs_N;

WITH duplicate_CTE AS
(select*,
Row_NUMBER () OVER(partition by company,location,industry,
total_laid_off,'DATE',stage,country,funds_raised_millions)
as row_num
from layoffs_N) 

SELECT*
FROM DUPLICATE_CTE
WHERE ROW_NUM > 1 ;

SELECT*
FROM DUPLICATE_CTE
WHERE COMPANY ='casper' ;

CREATE TABLE `world_layoffs`.`layoffs_n2`
 (`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT) ;

select*
from layoffs_n2
where row_num > 1 ;

insert into layoffs_n2
(select*,
Row_NUMBER () OVER(partition by company,location,industry,
total_laid_off,'DATE',stage,country,funds_raised_millions)
as row_num
from layoffs_N);

SELECT*
from layoffs_n2 ;

SET SQL_SAFE_UPDATES = 0;
delete from layoffs_n2
where row_num > 1 ;


				     -- 2-Standardizing the Data --

select company , trim(company)
from layoffs_n2 ;

update layoffs_n2 
set company = trim(company) ;

select distinct industry
from layoffs
order by 1;

UPDATE layoffs_n2 
JOIN layoffs
  ON  layoffs_n2.company = layoffs.company
SET  layoffs_n2.industry = layoffs.industry
WHERE layoffs_n2.industry BETWEEN 1 AND 1000;

select*
from layoffs_n2 ;

select distinct location
from layoffs_n2 ;

select distinct country ,trim(trailing '_' from country)
from layoffs_n2 
order by 1;

UPDATE layoffs_n2
SET country = TRIM(TRAILING '.' FROM country);

select *
from layoffs_n2 ;

alter table layoffs_n2
modify column `DATE`Date ;

select  `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_n2 ;

UPDATE layoffs_n2 
set date = str_to_date(`date`,'%m/%d/%Y');

select*
from layoffs_n2 ;

				 -- 3- Null Values or Blank Values --

select*
from layoffs_n2 
where industry is null 
or industry ='';

update layoffs_n2 
set industry = null 
where industry = '';

select t1.industry,t2.industry
from layoffs_n2 as t1
join layoffs_n2 as t2
on t1.company = t2.company
where t1.industry is null and t2.industry is not null ;

update layoffs_n2 as t1
join layoffs_n2 as t2
on t1.company = t2.company
set t1.industry=t2.industry
where t1.industry is null and t2.industry is not null ;

select*
from layoffs_n2 
where company = 'Airbnb';

				     -- 4- Remove Column and Rows --
select*
from layoffs_n2 
where total_laid_off is null
and percentage_laid_off is null;

DELETE
from layoffs_n2 
where total_laid_off is null
and percentage_laid_off is null;

select*
from layoffs_n2;

ALTER TABLE layoffs_n2 
DROP COLUMN ROW_NUM ;

select*
from layoffs_n2;

