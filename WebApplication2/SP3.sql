CREATE PROCEDURE usp_TotalHours (
@StartDate AS DateTime,
@EndDate AS DateTime
)
AS
BEGIN

 SELECT 
		Employee.[First Name] + ' ' + Employee.[Last Name] AS 'Name',
		(Time.[Total Hours] * Employee.[Pay Rate]) AS 'Total Hours',
		FORMAT(Time.[Time in], 'd', 'en-gb') AS 'Worked On'

 FROM Employee
	inner join Time on
		Employee.ID = Time.EmployeeIdFK
 
 WHERE
		Time.[Time in] between @StartDate and @EndDate
 
 GROUP BY
		Employee.[First Name] + ' ' + Employee.[Last Name],
		FORMAT(Time.[Time in], 'd', 'en-gb'),
		(Time.[Total Hours] * Employee.[Pay Rate])
 END