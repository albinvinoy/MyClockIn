CREATE TABLE [dbo].[Time] (
    [Time in]        DATETIME NOT NULL,
    [Time out]       DATETIME NOT NULL,
    [Work / Abscent] BIT      NOT NULL,
    [Worked for ID]  INT      NOT NULL,
    [Total Hours]    DATETIME NOT NULL,
    [EmployeeIdFK]   INT      NULL,
    CONSTRAINT [Employee_ID] FOREIGN KEY ([EmployeeIdFK]) REFERENCES [dbo].[Employee] ([ID])
);

