--Comprobar los valores unicos de id
SELECT DISTINCT id
FROM Daily.Sleep;--24 usuarios

--Comprobar si existe algún valor nulo
SELECT *
FROM Daily.Sleep
WHERE (Id IS NULL OR
    SleepDayOnly IS NULL OR
    TotalMinutesAsleep IS NULL OR
    TotalTimeInBed IS NULL);


-- WEIGHT
--Comprobar los valores unicos de id
SELECT DISTINCT id
FROM Daily.Weight;--8 usuarios

--Comprobar si existe algún valor nulo
SELECT *
FROM Daily.Weight
WHERE (Id IS NULL OR
    WDate IS NULL OR
    WeightKg IS NULL OR
    BMI IS NULL);