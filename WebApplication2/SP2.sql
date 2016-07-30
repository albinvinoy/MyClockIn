CREATE PROCEDURE usp_PayHour
(
@EmpId AS INT,
@StartDate AS DATETIME,
@EndDate AS DATETIME
)

AS
BEGIN

SELECT 
		Employee.[First Name] + ' ' + Employee.[Last Name] AS 'Name',
		sum(Time.[Total Hours]) AS 'Total Hours',
		FORMAT(Time.[Time in], 'd', 'en-gb') AS 'Worked On'

FROM Employee
	inner join Time on
		Employee.ID = @EmpId and Time.EmployeeIdFK = @EmpId

WHERE 
		Time.[Time in] between @StartDate and @EndDate 

GROUP BY 
		FORMAT(Time.[Time in], 'd', 'en-gb'),
		Employee.[First Name] + ' ' +Employee.[Last Name]

END