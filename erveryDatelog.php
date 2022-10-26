221026

UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120083;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120119;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120717;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120796;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201206985;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207063;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207242;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207300;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207338;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201208064;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201208073;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201600375;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201600917;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201601314;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900109;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900290;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900337;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900561;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900751;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900879;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201901042;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000111;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000141;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000255;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000283;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000470;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202001191;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202001266;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100068;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100308;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100513;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100531;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100551;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202102127;



(cu_piece_feedback = 1
OR cu_temperature_feedback = 1
OR cu_temperature_type = 1
OR cu_tengsen_trmperature = 1
OR cu_sign_feedback = 1
OR cu_goods_print = 1
OR cu_send_message = 0
OR cu_print_express_remark = 1)



SELECT count(*) from customer WHERE cu_piece_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_temperature_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_temperature_type = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_tengsen_trmperature = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_sign_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_goods_print = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_send_message = 0 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_print_express_remark = 1 and cu_visible=1;


SELECT count(*) from tms_customer_config WHERE cu_piece_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_temperature_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_temperature_type = 1;

SELECT count(*) from tms_customer_config WHERE  cu_tengsen_trmperature = 1;

SELECT count(*) from tms_customer_config WHERE  cu_sign_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_goods_print = 1;

SELECT count(*) from tms_customer_config WHERE  cu_send_message = 0;

SELECT count(*) from tms_customer_config WHERE  cu_print_express_remark = 1;








SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_piece_feedback != 1 and c.cu_piece_feedback = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_temperature_feedback != 1 and  c.cu_temperature_feedback = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_temperature_type != 1 and  c.cu_temperature_type = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_sign_feedback != 1 and  c.cu_sign_feedback = 1 and c.cu_visible=1;





SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id tcc.cu_piece_feedback != 1 and c.cu_piece_feedback = 1 AND c.cu_visible = 1; 





