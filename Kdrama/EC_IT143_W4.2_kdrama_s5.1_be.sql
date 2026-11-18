SELECT v.kdrama_id
     , v.drama_name
     , v.release_year
INTO dbo.t_kdrama
FROM dbo.v_kdrama_load AS v;
GO