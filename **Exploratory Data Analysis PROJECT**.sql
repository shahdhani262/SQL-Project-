                        -- Explatory Data Analysis --
select*
from layoffs_n2;

select max(total_laid_off) , max(percentage_laid_off)
from layoffs_n2 ;
  
select*
from layoffs_n2
where percentage_laid_off =1  
order by funds_raised_millions desc
;

select company,sum(total_laid_off)
from layoffs_n2
group by company
order by 2 desc ;

select max(`date`) , min(`date`)
from layoffs_n2 ;

select industry ,sum(total_laid_off)
from layoffs_n2
group by industry
order by 2 desc ;

select year(`date`) ,sum(total_laid_off)
from layoffs_n2
group by year(`date`)
order by 1 desc ;

select company,sum(percentage_laid_off)
from layoffs_n2
group by company
order by 2 desc ;

select substring(`date`,1,7) AS `month`,sum(percentage_laid_off)
from layoffs_n2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
 ;
 
 WITH rolling_table AS 
 ( SELECT  SUBSTRING(`date`, 1, 7) AS `month`,
 SUM(percentage_laid_off) AS monthly_percentage
    FROM layoffs_n2
    WHERE `date` IS NOT NULL
    GROUP BY `month`)
SELECT `month`,SUM(monthly_percentage) 
OVER (ORDER BY `month` ASC) AS rolling_percentage
FROM rolling_table;

select company,year(`date`),sum(total_laid_off)
from layoffs_n2
group by company,year(`date`)
order by company asc ;

select company,year(`date`),sum(total_laid_off)
from layoffs_n2
group by company,year(`date`)
order by 3 desc ;

with company_year (company,years,total_laid_off) as
(select company,year(`date`),sum(total_laid_off)
from layoffs_n2
group by company,year(`date`)
order by 3 desc ) , Company_year_rank as
(select*,dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null)
select*
from Company_year_rank 
where ranking>= 5 
;
