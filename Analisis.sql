-- Dias que el dispositivo es usado.
SELECT FORMAT_TIMESTAMP("%A", ActivityDate) AS DayWeek,
    COUNT(FORMAT_TIMESTAMP("%A", ActivityDate))
FROM Daily.Activities_DiasUso
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




-- ############# ACTIVITIES ##############
--Calcular el promedio de las categorias para cada individo en cada dia de la semana.
SELECT Id,
  FORMAT_TIMESTAMP("%A", ActivityDate) as DayOfWeek,
  AVG(TotalSteps) AS AvgSteps, MIN(TotalSteps) AS MinSteps, MAX(TotalSteps) AS MaxSteps,
  AVG(VeryActiveMinutes) AS AvgActive, MIN(VeryActiveMinutes) AS MinActive, MAX(VeryActiveMinutes) AS MaxActive,
  AVG(FairlyActiveMinutes) AS AvgFairly, MIN(FairlyActiveMinutes) AS MinFairly, MAX(FairlyActiveMinutes) AS MaxFairly,
  AVG(LightlyActiveMinutes) AS AvgLightly, MIN(LightlyActiveMinutes) AS MinLightly, MAX(LightlyActiveMinutes) AS MaxLightly,
  AVG(SedentaryMinutes) AS AvgSedentary, MIN(SedentaryMinutes) AS MinSedentary, MAX(SedentaryMinutes) AS MaxSedentary,
  AVG(Calories) AS AvgCalories, MIN(Calories) AS MinCalories, MAX(Calories) AS MaxCalories
FROM Daily.Activities_DiasUso
GROUP BY 1, 2
ORDER BY 1, CASE 
              WHEN DayOfWeek ='Monday' THEN 1
              WHEN DayOfWeek ='Tuesday' THEN 2
              WHEN DayOfWeek ='Wednesday' THEN 3
              WHEN DayOfWeek ='Thursday' THEN 4
              WHEN DayOfWeek ='Friday' THEN 5
              WHEN DayOfWeek ='Saturday' THEN 6
              WHEN DayOfWeek ='Sunday' THEN 7
              END;
-- Se Guardo En Tabla "SummaryIndividual" El Resultado Anterior


-- Promedio de las categorias para todo el conjunto agrupado por dia.
SELECT
  DayOfWeek,
  ROUND(AVG(AvgSteps),3) AS pSteps,
  ROUND(AVG(MinSteps),3) AS pMinSteps,
  ROUND(AVG(MaxSteps),3) AS pMaxSteps,
  ROUND(AVG(AvgActive),3) AS pActive,
  ROUND(AVG(MinActive),3) AS pMinActive,
  ROUND(AVG(MaxActive),3) AS pMaxActive,
  ROUND(AVG(AvgFairly),3) AS pFairly,
  ROUND(AVG(MinFairly),3) AS pMinFairly,
  ROUND(AVG(MaxFairly),3) AS pMaxFairly,
  ROUND(AVG(AvgLightly),3) AS pLightly,
  ROUND(AVG(MinLightly),3) AS pMinLightly,
  ROUND(AVG(MaxLightly),3) AS pMaxLightly,
  ROUND(AVG(AvgSedentary),3) AS pSedentary,
  ROUND(AVG(MinSedentary),3) AS pMinSedentary,
  ROUND(AVG(MaxSedentary),3) AS pMaxSedentary,
  ROUND(AVG(AvgCalories),3) AS pCalories,
  ROUND(AVG(MinCalories),3) AS pMinCalories,
  ROUND(AVG(MaxCalories),3) AS pMaxCalories
FROM Daily.SummaryIndividual
GROUP BY 1
ORDER BY CASE 
            WHEN DayOfWeek ='Monday' THEN 1
            WHEN DayOfWeek ='Tuesday' THEN 2
            WHEN DayOfWeek ='Wednesday' THEN 3
            WHEN DayOfWeek ='Thursday' THEN 4
            WHEN DayOfWeek ='Friday' THEN 5
            WHEN DayOfWeek ='Saturday' THEN 6
            WHEN DayOfWeek ='Sunday' THEN 7
            END;




-- ########## SLEEP ##########

--Calcular el promedio de sueño para cada individo en cada dia de la semana.
SELECT Id,
  FORMAT_TIMESTAMP("%A", SleepDayOnly) as DayOfWeek,
  AVG(TotalMinutesAsleep) AS AvgSleep, MIN(TotalMinutesAsleep) AS MinSleep, MAX(TotalMinutesAsleep) AS MaxSleep,
  AVG(TotalTimeInBed) AS AvgBed, MIN(TotalTimeInBed) AS MinBed, MAX(TotalTimeInBed) AS MaxBed,
FROM Daily.Sleep
GROUP BY 1, 2
ORDER BY 1, CASE 
              WHEN DayOfWeek ='Monday' THEN 1
              WHEN DayOfWeek ='Tuesday' THEN 2
              WHEN DayOfWeek ='Wednesday' THEN 3
              WHEN DayOfWeek ='Thursday' THEN 4
              WHEN DayOfWeek ='Friday' THEN 5
              WHEN DayOfWeek ='Saturday' THEN 6
              WHEN DayOfWeek ='Sunday' THEN 7
              END;
-- Se Guardo En Tabla "SummarySleep" El Resultado Anterior

-- Promedio de sueño para todo el conjunto agrupado por dia.
SELECT
  DayOfWeek,
  ROUND(AVG(AvgSleep),3) AS pSleep,
  ROUND(AVG(MinSleep),3) AS pMinSleep,
  ROUND(AVG(MaxSleep),3) AS pMaxSleep,
  ROUND(AVG(AvgBed),3) AS pBed,
  ROUND(AVG(MinBed),3) AS pMinBed,
  ROUND(AVG(MaxBed),3) AS pMaxBed,
FROM Daily.SummarySleep
GROUP BY 1
ORDER BY CASE 
            WHEN DayOfWeek ='Monday' THEN 1
            WHEN DayOfWeek ='Tuesday' THEN 2
            WHEN DayOfWeek ='Wednesday' THEN 3
            WHEN DayOfWeek ='Thursday' THEN 4
            WHEN DayOfWeek ='Friday' THEN 5
            WHEN DayOfWeek ='Saturday' THEN 6
            WHEN DayOfWeek ='Sunday' THEN 7
            END;


