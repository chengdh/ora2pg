INSERT INTO equip_bill_residential (
    imp_id,
    import_from,
    bill_type,
    client_categ,
    client_name,
    client_address,
    juridical_person,
    juridical_person_id,
    juridical_person_mobile,
    project_name,
    project_no,
	building_count,
	building_area,
	households_count,
	invoice_header,
	invoice_tax_no,
	invoice_address,
	invoice_phone,
	invoice_bank,
	invoice_bankno,
    use_water_categ,
    water_watch_categ,
    require_datetime,
    plan_support_datetime,
    state
)
SELECT 
	CHANGEGUID  	AS imp_id,
	CHANNEL  		AS import_from,
	'residential' 	AS bill_type,
	'enterprise'	AS client_categ,
	customer_name 	AS client_name,
	customer_addr 	AS client_address,
	customer_name 	AS juridical_person,
	COALESCE(ID_CARD,'无')  AS juridical_person_id,
	MOBILEPHONE 	AS juridical_person_mobile,
	customer_name 	AS project_name,
	'无' 			AS project_no,
	0 			AS	building_count,
	0 			AS	building_area,
	0 			AS	households_count,
	'无' 			AS	invoice_header,
	'无' 			AS	invoice_tax_no,
	'无' 			AS	invoice_address,
	'无' 			AS	invoice_phone,
	'无' 			AS	invoice_bank,
	'无' 			AS	invoice_bankno,
	CASE 	WHEN PRICE_TYPE_ID = '居民用水' THEN 'resident'
			WHEN PRICE_TYPE_ID  = '非居民用水' THEN 'not_resident'
			ELSE 'resident'
	END 			AS use_water_categ,	
	CASE 	WHEN BZ_TYPE= 0 THEN 'new'
			WHEN BZ_TYPE=1 THEN 'modify'
			ELSE 'new'
	END 			    AS water_watch_categ,
	CREATEDDATE  	AS require_datetime,
	CREATEDDATE + interval '2 month' AS plan_support_datetime,
	'draft' 		AS state
FROM BZ_APPLY
WHERE USER_TYPE = 1
AND CHANGEGUID NOT IN (SELECT imp_id from equip_bill_residential where imp_id is not null)	