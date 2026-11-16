alter table imports_exports_raw
alter column date
type date using date::date
;
