CREATE TABLE [dbo].[Employee] (
    [ID]             INT          NOT NULL,
    [Last Name]      VARCHAR (20) NOT NULL,
    [First Name]     VARCHAR (15) NOT NULL,
    [Phone Number]   INT          NOT NULL,
    [Email]          VARCHAR (40) NOT NULL,
    [Pay Rate]       FLOAT (53)   NOT NULL,
    [username]       VARCHAR (15) NOT NULL,
    [password]       VARCHAR (20) NOT NULL,
    [Security Level] TINYINT      NOT NULL,
    [Notes]          CHAR (200)   NULL,
    [Department_ID]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DepartmentFK] FOREIGN KEY ([Department_ID]) REFERENCES [dbo].[Department] ([Department ID])
);

