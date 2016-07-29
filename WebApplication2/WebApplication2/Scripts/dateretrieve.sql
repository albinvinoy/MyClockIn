declare @startDate table (
timein datetime,
timeot datetime,
hrs float
)

insert into @startDate (timein, timeot, hrs)
select [Time in], [Time out], [Total Hours]
from Time;

select *
from @startDate;