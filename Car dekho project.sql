Create schema cars;
Use cars;

-- Read Data-- 
SELECT * FROM cars.`car dekho`;
-- Total Cars: To get a count of total records --
select count(*) from `car dekho`;
-- The manager asked the employee How many cars will be available in 2023?--
select count(*) from `car dekho` where year = 2023;
-- The manager asked the employee How many cars is available in 2020, 2021, 2022--
select count(*) from `car dekho` where year = 2020; #74
select count(*) from `car dekho` where year = 2021; #7
Select count(*) from `car dekho` where year = 2022; #7
-- Group By--
Select count(*) from `car dekho` where year in (2020, 2021, 2022) group by year;
-- Client asked me to print the total of all cars by year. I don't see all the details--
Select year, count(*)  from `car dekho` group by year;
-- Client asked to car dealer agent How many disel cars will there be in 2020?--
 select count(*) from `car dekho` where year= 2020 and fuel = "diesel"
  
 -- Client requested a car dealer agent How many petrol cars is there in 2020?--
  select count(*) from `car dekho` where year= 2020 and fuel = "Petrol"; #51

-- The manager told the employee to give a print All the fuel cars(petrol, diesel, and CNG) come by all year.--
select year, count(*) from `car dekho` where fuel = "petrol" group by year;  
select year, count(*) from `car dekho` where fuel = "Diesel" group by year;  
select year, count(*) from `car dekho` where fuel = "CNG" group by year;  

-- Manager sai there were more than 100 cars in a given year, which year had more than 100 cars?--
select year, count(*) from `car dekho` group by year having count(*)>100;
select year, count(*) from `car dekho` group by year having count(*)<50;

-- The manager said to the employee All cars count details between 2015 and 2023; we need a complete list.--
select count(*) from `car dekho` where year between 2015 and 2023;

-- The manager said to the employee All cars details details between 2015 and 2023, we need a complete list.--
select * from `car dekho` where year between 2015 and 2023;

-- END -- 