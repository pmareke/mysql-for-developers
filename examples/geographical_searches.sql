SELECT stDistanceSphere(
  point(lat1, long1), 
  point(lat2, long2)
);

SELECT 
  * 
FROM 
  addresses 
WHERE 
  ST_Distance_Sphere(
    POINT(-97.745363, 30.324014), 
    POINT(longitude, latitude)
  ) < 1609;

SELECT
  *
FROM
  addresses
WHERE
  latitude BETWEEN 30.30954084441 AND 30.33848715559    -- Bounding box latitude 
  AND
  longitude BETWEEN -97.76213017291 AND -97.72859582708 -- Bounding box longitude
  AND
    ST_Distance_Sphere(
      point(-97.745363, 30.324014),
      point(longitude, latitude)
    ) <= 1609;

ALTER TABLE addresses ADD INDEX idx_latitude (latitude);

