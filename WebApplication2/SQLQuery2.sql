--SELECT Employee.[First Name] + ' ' + Employee.[Last Name] AS Name
--	,Time.[Total Hours] * Employee.[Pay Rate] AS PayTotal 
--	,Time.[Total Hours], FORMAT(Time.[Time in], 'd', 'en-gb') AS Worked_On 
--FROM Employee INNER JOIN Time ON Employee.ID = Time.EmployeeIdFK
--Order BY FORMAT(Time.[Time in], 'd', 'en-gb')
 
 select Employee.[First Name]
 , Time.[Total Hours] * Employee.[Pay Rate] as Total_Pay 
 , Time.[Time in]
 from Employee
 inner join Time on
 Employee.ID = Time.EmployeeIdFK
 where Time.[Time in] between '7/23/2016' and '7/26/2016'
