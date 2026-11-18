DROP VIEW IF EXISTS dbo.v_kdrama_load;
GO

CREATE VIEW dbo.v_kdrama_load
AS
-----------------------------------------------------------------------
-- NAME:      dbo.v_kdrama_load
-- PURPOSE:   Create the K-Drama Shows - Load view
-----------------------------------------------------------------------
SELECT kdrama_id
     , drama_name
     , year AS release_year
FROM dbo.KDrama_Shows;
GO