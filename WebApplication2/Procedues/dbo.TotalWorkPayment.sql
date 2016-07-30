 CREATE PROCEDURE clock_TotalWorkPayment (
@EmpID AS INT,
@StartDate AS DateTime,
@EndDate AS DateTime
)
AS
BEGIN

 SELECT 
		Employee.[First Name] + ' ' + Employee.[Last Name] AS 'Name',
		(Time.[Total Hours] * Employee.[Pay Rate]) AS 'Total Payment',
		CONVERT(varchar(10) ,Time.[Time in], 101 ) AS 'Work Date'
 FROM Employee
 inner join Time on
	Employee.ID = @EmpID AND Time.EmployeeIdFK = @EmpID
 
 WHERE 
		Time.[Time in] between @StartDate and @EndDate
 
 GROUP BY 
		Employee.[First Name] + ' ' + Employee.[Last Name],
		CONVERT(varchar(10) ,Time.[Time in], 101 ),
		(Time.[Total Hours] * Employee.[Pay Rate])
 END