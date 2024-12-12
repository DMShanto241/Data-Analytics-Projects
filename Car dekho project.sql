SELECT * FROM cars.car_dekho;
Use cars;
-- Read Data --
Select * from car_dekho
-- Total Cars: To get a count of total records--
Select count(*) from car_dekho;
-- The manager asked the employee, how many cars will be available for next 2023?--
Select count(*) from car_dekho where year = 2023;
-- The manager asked the employee, how many cars will be available for next 2020, 2021, 2022?--
-- Group by --
Select count(*) from car_dekho where year in (2020,2021,2022) group by year;
-- Client told me to print the total of all cars per year. I don't see all the details--
Select year, count(*) from car_dekho group by year;
-- Client asked to car dealer agent How many diesel cars will there be in 2020?--
Select Count(*) from car_dekho where year = 2020 and fuel = "Diesel";
 -- Client requested a car dealer agent How many petrol cars is there in 2020?--
Select Count(*) from car_dekho where year = 2020 and fuel = "Petrol";
-- The manager told the employee to print a list of All the fuel cars(petrol, diesel, and CNG) based on the years.--
Select year, count(*) from car_dekho where fuel = "Diesel" group by year;
Select year, count(*) from car_dekho where fuel = "Petrol" group by year;
Select year, count(*) from car_dekho where fuel = "CNG" group by year;
-- Manager said there were more than 100 cars in a given year, which year had more than 100 cars?--
Select year, count(*) from car_dekho group by year having count(*)>100;
-- The manager said to the employee All cars COUNT details between 2015 and 2023; we need a complete list.--
Select count(*) from car_dekho where year between 2015 and 2023;
-- The manager said to the employee All cars details details between 2015 and 2023, we need a complete list.--
Select * from car_dekho where year between 2015 and 2023;
-- END -- 