SELECT v.group_name
     , v.company_name
     , v.debut_date
INTO dbo.t_kpop
FROM dbo.v_kpop_load AS v;
GO