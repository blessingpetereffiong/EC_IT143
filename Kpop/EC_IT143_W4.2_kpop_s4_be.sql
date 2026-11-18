DROP VIEW IF EXISTS dbo.v_kpop_load;
GO

CREATE VIEW dbo.v_kpop_load
AS
-----------------------------------------------------------------------
-- NAME:      dbo.v_kpop_load
-- PURPOSE:   Create the K-pop Groups - Load view
-----------------------------------------------------------------------
SELECT Name AS group_name
     , Company AS company_name
     , DebutDate AS debut_date
FROM dbo.kpop_Groups;
GO