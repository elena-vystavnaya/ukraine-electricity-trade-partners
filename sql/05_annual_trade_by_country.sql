select clear_country,
		customs_regime,
		extract(year from date) as year,
		sum(amount) as sum_amount
from import_export_country
group by clear_country, year, customs_regime
order by year desc, customs_regime, sum_amount desc
;