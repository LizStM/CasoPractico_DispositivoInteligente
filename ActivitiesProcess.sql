--Comprobar los valores unicos de id
SELECT DISTINCT id
FROM Daily.Activities;--33 usuarios

--Comprobar si existe algún valor nulo
SELECT *
FROM Daily.Activities
WHERE (Id IS NULL OR
    ActivityDate IS NULL OR
    TotalSteps IS NULL OR
    VeryActiveMinutes IS NULL OR
    FairlyActiveMinutes IS NULL OR
    LightlyActiveMinutes IS NULL OR
    SedentaryMinutes IS NULL OR
    Calories IS NULL);

--Valores de actividad iguales a 0
SELECT Id, ActivityDate, TotalSteps, VeryActiveMinutes, 
        FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes, Calories
FROM Daily.Activities
WHERE (
    TotalSteps = 0 AND
    VeryActiveMinutes = 0 AND
    FairlyActiveMinutes = 0 AND
    LightlyActiveMinutes = 0);

--Revisar cuantas horas se durmio cuando no se tiene datos de atividad
WITH ceros AS(
    SELECT Id, ActivityDate, TotalSteps, VeryActiveMinutes, 
        FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes
    FROM Daily.Activities
    WHERE (
        TotalSteps = 0 AND
        VeryActiveMinutes = 0 AND
        FairlyActiveMinutes = 0 AND
        LightlyActiveMinutes = 0)
)
SELECT c.Id, c.ActivityDate, c.TotalSteps, c.VeryActiveMinutes, 
        c.FairlyActiveMinutes, c.LightlyActiveMinutes, c.SedentaryMinutes, S.TotalMinutesAsleep
FROM
    ceros c INNER JOIN Daily.Sleep S USING (Id)
WHERE c.ActivityDate = S.SleepDayOnly;

--Revisar si se registro peso cuando no se tiene datos de atividad
WITH ceros AS(
    SELECT Id, ActivityDate, TotalSteps, VeryActiveMinutes, 
        FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes
    FROM Daily.Activities
    WHERE (
        TotalSteps = 0 AND
        VeryActiveMinutes = 0 AND
        FairlyActiveMinutes = 0 AND
        LightlyActiveMinutes = 0)
)
SELECT c.Id, c.ActivityDate, c.TotalSteps, c.VeryActiveMinutes, 
        c.FairlyActiveMinutes, c.LightlyActiveMinutes, c.SedentaryMinutes, W.WDate
FROM
    ceros c INNER JOIN Daily.Weight W USING (Id)
WHERE c.ActivityDate = W.WDate;

-- >El dispositivo inteligene no se ocupo en los días con registros de valor = 0.



-- Dias cuando esta prendido el dispositivo pero no es ocupado
SELECT FORMAT_TIMESTAMP("%A", ActivityDate) AS DayWeek,
    COUNT(FORMAT_TIMESTAMP("%A", ActivityDate))
FROM Daily.Activities
WHERE (
    TotalSteps = 0 AND
    VeryActiveMinutes = 0 AND
    FairlyActiveMinutes = 0 AND
    LightlyActiveMinutes = 0)
GROUP BY 1
ORDER BY CASE 
              WHEN DayWeek ='Monday' THEN 1
              WHEN DayWeek ='Tuesday' THEN 2
              WHEN DayWeek ='Wednesday' THEN 3
              WHEN DayWeek ='Thursday' THEN 4
              WHEN DayWeek ='Friday' THEN 5
              WHEN DayWeek ='Saturday' THEN 6
              WHEN DayWeek ='Sunday' THEN 7
              END;

-- Dias cuando el dispositivo esta encendido, en general
SELECT FORMAT_TIMESTAMP("%A", ActivityDate) AS DayWeek,
    COUNT(FORMAT_TIMESTAMP("%A", ActivityDate))
FROM Daily.Activities
GROUP BY 1
ORDER BY CASE 
              WHEN DayWeek ='Monday' THEN 1
              WHEN DayWeek ='Tuesday' THEN 2
              WHEN DayWeek ='Wednesday' THEN 3
              WHEN DayWeek ='Thursday' THEN 4
              WHEN DayWeek ='Friday' THEN 5
              WHEN DayWeek ='Saturday' THEN 6
              WHEN DayWeek ='Sunday' THEN 7
              END;


-- Borrar registros cuando el dispositivo esta encedido pero no es ocupado
/*
DELETE
FROM Daily.Activities
WHERE (
    TotalSteps = 0 AND
    VeryActiveMinutes = 0 AND
    FairlyActiveMinutes = 0 AND
    LightlyActiveMinutes = 0);
*/

