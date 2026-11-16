select extract(year from date) as year,
	country,
	ier.customs_regime,
	sum(amount) as sum_amount
from imports_exports_raw ier 
group by year,
	country,
	customs_regime
order by year desc
;

select extract(year from date) as year,
	sum(amount) filter (where customs_regime = 'експорт') as total_export_sum,
	sum(amount) filter (where customs_regime = 'імпорт') as total_import_sum
from imports_exports_raw ier 
group by year
order by year desc
;
