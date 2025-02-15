-- Data Cleaning

-- now when we are data cleaning we usually follow a few steps
-- 1. Remove dublicates
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

-- 1. Remove Duplicates

Create table layoff_staging
like layoffs

Insert layoff_staging
select* from
layoffs

Select * from layoff_staging

Select*, Row_Number() Over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoff_staging

With dublicate_Cte as
(
Select*, Row_Number() Over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoff_staging
)
Select * 
from dublicate_Cte
where row_num > 1

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
);

Select * from 
layoff_staging2


Insert into layoff_staging2
Select*, Row_Number() Over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoff_staging;

Delete from
layoff_staging2
where row_num>1;

-- 2 Standardizing data

Select company, trim(company)
from layoff_staging2

Update layoff_staging2
set company = trim(company);


Select distinct industry
from layoff_staging2
order by 1

Select * from 
layoff_staging2
where industry like'crypto%';

Update layoff_staging2
set industry= 'Crypto'
where industry like 'Crypto%'

Select distinct Country, trim(trailing '.' from country)
from layoff_staging2
order by 1

Update layoff_staging2
set country = trim(trailing '.' from country)
where country like 'United States%'

Update layoff_staging2
Set `date` = Str_to_date (`date`, '%m/%d/%Y')

Select `date` from layoff_staging2

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

-- 3. Look at Null Values

Select * 
from layoff_staging2
where industry is null
or industry = '';

Select * 
from layoff_staging2
where company ='Airbnb'

SELECT t1.industry, t2.industry
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
    ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

Update layoff_staging2
set industry = null
where industry= ''

UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

-- 4. remove any columns and rows we need to

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL;


SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Delete Useless data we can't really use
DELETE FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging2;

Alter table layoff_staging2
drop column row_num