SELECT
  T.tpep_pickup_datetime,
  T.tpep_dropoff_datetime,
  T.fare_amount,
  T.pickup_zip,
  T.dropoff_zip,
  T.trip_distance,
  T.weekday,
  CASE
    WHEN T.weekday = 1 THEN 'Sunday'
    WHEN T.weekday = 2 THEN 'Monday'
    WHEN T.weekday = 3 THEN 'Tuesday'
    WHEN T.weekday = 4 THEN 'Wednesday'
    WHEN T.weekday = 5 THEN 'Thursday'
    WHEN T.weekday = 6 THEN 'Friday'
    WHEN T.weekday = 7 THEN 'Saturday'
    ELSE 'N/A'
  END AS day_of_week
FROM
  (
    SELECT
      dayofweek(tpep_pickup_datetime) as weekday,
      *
    FROM
      `samples`.`nyctaxi`.`trips`
    WHERE
      trip_distance > 0
      AND trip_distance < 10
      AND fare_amount > 0
      AND fare_amount < 50
  ) T
ORDER BY
  T.weekday  