<?


SELECT
	GROUP_CONCAT( tro.to_no ) AS `to_nos`,
	`ro`.`start_region_name`,
	`ro`.`ro_name`,
	`ro`.`ro_id`,
	GROUP_CONCAT( di.di_id ) AS `di_ids`,
	GROUP_CONCAT( tro.to_id ) AS `to_ids`,
	`tssr`.`tssr_state`,
	`ts`.`tms_sup_name` 
FROM
	`dispatch` `di`
	LEFT JOIN `order_dispatch` `od` ON od.di_id = di.di_id
	LEFT JOIN `dispatch_detail` `dd` ON di.di_dd_id = dd.dd_id
	LEFT JOIN `order_worksheet` `ow` ON ow.di_id = dd.di_id
	LEFT JOIN `transport_order` `tro` ON tro.to_id = od.to_id
	RIGHT JOIN `route` `ro` ON ro.ro_id = dd.ro_id
	RIGHT JOIN `tms_supplier` `ts` ON ts.tms_sup_id = ro.su_id
	LEFT JOIN `tms_su_shipment_route` `tssr` ON tssr.ro_id = dd.ro_id 
	AND tssr_visible = 1 
WHERE
	od.od_visible = 1 
	AND ow.ow_status = 1 
	AND di.di_status IN ( 0, 1, 5 ) 
	AND ow.ow_type IN ( 2, 12 ) 
	AND tro.to_status NOT IN ( 0, 7, 8, 9 ) 
	AND dd.departure_trans_time >= 1727193600 
	AND ( tssr.tssr_state != 2 OR tssr.tssr_state IS NULL ) 
	AND ro.rt_id NOT IN ( 4, 5, 6, 7 ) 
	AND ro.su_id IN ( 153 ) 
	AND ro.rt_id IN ( 1, 9 ) 
	AND ro.ro_status = 0 
GROUP BY
	`ro`.`ro_id` 
ORDER BY
	`ro`.`ro_id` DESC 
	LIMIT 100

