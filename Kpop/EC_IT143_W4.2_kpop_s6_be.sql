-- 1) Reload data
TRUNCATE TABLE dbo.t_kpop;

INSERT INTO dbo.t_kpop (group_name, company_name, debut_date)
SELECT v.group_name
     , v.company_name
     , v.debut_date
FROM dbo.v_kpop_load AS v;

-- 2) Review results
SELECT t.*
FROM dbo.t_kpop AS t;