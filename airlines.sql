-- How many incidents occured each year?

select year, count(year) as counts from airlines_table group by year order by counts desc;

-- Accidents each month

select month, count(month) as counts from airlines_table group by month order by counts desc;

-- Count by airline

select airline, count(airline) as counts from airlines_table group by airline order by counts desc;

-- Year, Season vise analysis
SELECT
    year,
    CASE
        WHEN month IN ('December', 'January', 'February') THEN 'Winter'
        WHEN month IN ('March', 'April', 'May') THEN 'Spring'
        WHEN month IN ('June', 'July', 'August') THEN 'Summer'
        WHEN month IN ('September', 'October', 'November') THEN 'Fall'
    END AS season,
    COUNT(*) AS incident_count
FROM
    airlines_table
GROUP BY
    year,
    season
ORDER BY
    year, FIELD(season, 'Winter', 'Spring', 'Summer', 'Fall');

-- Incidents by season
SELECT
    CASE
        WHEN month IN ('December', 'January', 'February') THEN 'Winter'
        WHEN month IN ('March', 'April', 'May') THEN 'Spring'
        WHEN month IN ('June', 'July', 'August') THEN 'Summer'
        WHEN month IN ('September', 'October', 'November') THEN 'Fall'
    END AS season,
    COUNT(*) AS incident_count
FROM
    airlines_table
GROUP BY
    season
ORDER BY
    FIELD(season, 'Winter', 'Spring', 'Summer', 'Fall');

