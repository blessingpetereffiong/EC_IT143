DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS
-----------------------------------------------------------------------
-- NAME:      dbo.v_hello_world_load
-- PURPOSE:   Create the Hello World - Load view
-----------------------------------------------------------------------
SELECT 'Hello World' AS my_message, 
       GETDATE() AS current_date_time;
GO