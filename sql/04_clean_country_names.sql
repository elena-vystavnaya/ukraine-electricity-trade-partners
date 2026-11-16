create or replace view import_export_country as
	(select
		date,
		hour,
		customs_regime,
		country,
		energy_system,
		amount,
		case
			when country = 'Білорусь-0.4-110'
			then 'Білорусь'
			else country
		end as clear_country
	from imports_exports_raw ier)