DROP PROCEDURE IF EXISTS dbo.usp_kdrama_load;
GO

CREATE PROCEDURE dbo.usp_kdrama_load
AS
-----------------------------------------------------------------------
-- NAME:      dbo.usp_kdrama_load
-- PURPOSE:   Load K-Drama user stored procedure
-----------------------------------------------------------------------
BEGIN
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
END;
GO