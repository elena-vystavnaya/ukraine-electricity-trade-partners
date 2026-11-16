select count(*),
min(ier."date" ),
max(ier."date" ),
count(distinct date)
from imports_exports_raw ier
;

-- check all country
select distinct country
from imports_exports_raw ier 
;

select count(*),
min(rpr."date" ),
max(rpr."date" ),
count(distinct date)
from rdn_prices_raw rpr 
;

select rpr."date",
	rpr."hour",
	rpr.energy_system
from rdn_prices_raw rpr 
group by rpr."date",
	rpr."hour",
	rpr.energy_system
having count(*) > 1
order by date, hour, rpr.energy_system 
;

-- check all energy_system
select distinct energy_system
from imports_exports_raw
;

-- days which have '02:00-04:00' time interval
select date
from imports_exports_raw ier 
where hour = '02:00-04:00'
group by date
;

-- days when the clocks were changed
select date,
	energy_system,
	count(distinct hour) as hours_in_day
from rdn_prices_raw rpr 
group by date,
	energy_system
having count(distinct hour) != 24
order by date, energy_system 
;
