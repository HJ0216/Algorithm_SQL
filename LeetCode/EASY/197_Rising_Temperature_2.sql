WITH ALL_DATAS AS
(
    SELECT id
           , recordDate
           , temperature
           , LAG(recordDate) OVER (ORDER BY recordDate) as prevDate
           , LAG(temperature) OVER (ORDER BY recordDate) as prevTemperature
      FROM Weather
)
SELECT id
  FROM ALL_DATAS
 WHERE recordDate - prevDate = 1
   AND temperature > prevTemperature
;