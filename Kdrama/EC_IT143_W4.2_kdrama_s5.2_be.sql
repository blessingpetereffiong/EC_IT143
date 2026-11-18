DROP TABLE IF EXISTS dbo.t_kdrama;
GO

CREATE TABLE dbo.t_kdrama
(
    kdrama_id       VARCHAR(100) NOT NULL,
    drama_name      VARCHAR(200) NULL,
    release_year    INT NULL,
    CONSTRAINT PK_t_kdrama PRIMARY KEY CLUSTERED (kdrama_id ASC)
);
GO