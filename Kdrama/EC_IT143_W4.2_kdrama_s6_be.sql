-- 1) Reload data
TRUNCATE TABLE dbo.t_kdrama;

INSERT INTO dbo.t_kdrama (kdrama_id, drama_name, release_year)
SELECT v.kdrama_id
     , v.drama_name
     , v.release_year
FROM dbo.v_kdrama_load AS v;

-- 2) Review results
SELECT t.*
FROM dbo.t_kdrama AS t;