DROP TABLE IF EXISTS dbo.t_kpop;
GO

CREATE TABLE dbo.t_kpop
(
    kpop_id         INT IDENTITY(1,1) NOT NULL,
    group_name      VARCHAR(100) NULL,
    company_name    VARCHAR(100) NULL,
    debut_date      VARCHAR(50) NULL,
    CONSTRAINT PK_t_kpop PRIMARY KEY CLUSTERED (kpop_id ASC)
);
GO