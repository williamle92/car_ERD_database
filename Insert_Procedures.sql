-- inserting data into the tables
INSERT INTO customer(
	first_name,
	last_name,
	address,
	email,
	phone_number
)VALUES(
	'Alex',
	'Carushow',
	'1121 Lakers Blvd',
	'acarushow@lakers.com',
	'909-526-5632'
),(
	'Chris',
	'Paul',
	'12541 Suns Lane',
	'cpaul@suns.com',
	'565-459-4545'
),(
	'William',
	'Le',
	'Imperial lane',
	'wle@gmail.com',
	'714-565-8979'
),(
	'Tiger',
	'Woods',
	'121 golf road',
	'twoods@golf.com',
	'464-459-1267'
);


SELECT *
FROM vendor


--Insert values into vendor
INSERT INTO vendor(
	vendor_name,
	phone_number,
	address
)VALUES(
	'Lexus',
	'1-800-567-4514',
	'12134 Lexus Blvd'
),(
	'Toyota',
	'1-800-568-4751',
	'5760 Toyota Street'
),(
	'Mercedes',
	'1-800-579-2324',
	'1 Autobahn'
),(
	'Tesla',
	'1-877-564-4513',
	'23 Telsa Lane'
);


SELECT *
FROM salesperson


--Create a procedure to insert data into salesperson
CREATE OR REPLACE PROCEDURE add_data(firstname VARCHAR, lastname VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(first_name, last_name)
	VALUES(firstname, lastname);
END;
$$


--Calling the procedure to add datainto the table
CALL add_data('Willard', 'Le');
CALL add_data('Wilheim', 'LeChatlier');
CALL add_data('Vi', 'Trinh');



SELECT *
FROM car



--Insert data into car
INSERT INTO car(
	vin,
	model,
	year_car,
	color,
	amount,
	vendor_id
	
)VALUES(
	'2P4GH2535SR296546',
	'IS250',
	'2020',
	'Atomic Silver',
	'43562.99',
	'1'
),(
	'1GNDV23L65D296377',
	'RC',
	'2021',
	'Blue',
	'42220.00',
	'1'
),(
	'1N4AL11D96C260042',
	'Maybach S-Class',
	'2020',
	'Ruby metallic',
	'173000.00',
	'3'
),(
	'TRUWT28N011046197',
	'Model S',
	'2019', 
	'White',
	'72990.00',
	'4'
);


SELECT *
FROM vendor



--Insert into parts table
INSERT INTO part(
	name,
	description,
	amount,
	sku,
	vendor_id
)VALUES(
	'brakes',
	'genuine OEM brakes for Toyota models camry and corolla',
	'49.99',
	'SDFSE545',
	'2'
),(
	'car filter',
	'genuine OEM filter for Toyota and lexus models is250',
	'7.99',
	'GEDRGE54',
	'2'
),(
	'wheel cover',
	'Model 3 aero wheel cover',
	'25.00',
	'DSF235',
	'4'
),(
	'brakes',
	'genuine OEM brakes for Toyota models camry and corolla',
	'49.99',
	'SDFSE545',
	'2'
),(
	'Nos',
	'Turbo package for featured Lexus RC super cars',
	'999.99',
	'FJWE689',
	'1'
);


----Create a procedure to insert data into Mechanic
CREATE OR REPLACE PROCEDURE add_mechanic(firstname VARCHAR, lastname VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(first_name, last_name)
	VALUES(firstname, lastname);
END;
$$


--Insert mechanics
CALL add_mechanic('Bob', 'Builder');
CALL add_mechanic('Kim', 'Kardashian');
CALL add_mechanic('Michael', 'Jordan');


--Insert services into service table
INSERT INTO service(
	description,
	amount
)VALUES(
	'car brake replacement done by specialist Kim Kardashian. Pivot drill removal with dynamic robust machine to offset breaks',
	'199.99'
),(
	'air filter replacement done by the drill hose method',
	'99.99'
),(
	'Nos upgrade package to install turbo speed performance',
	'999.99'
);


SELECT *
FROM service


UPDATE service
SET
	date_service = '05/01/2021'
WHERE service_id = 1;

UPDATE service
SET
	date_service = '04/22/2021'
WHERE service_id = 3;

UPDATE service
SET
	date_service = '04/28/2021'
WHERE service_id = 2;



--Insert data into invoice
--Service invoice
INSERT INTO invoice(
	date_invoice,
	total_amount,
	part_id,
	service_id,
	salesperson_id,
	customer_id,
	mechanic_id
)VALUES(
	'05/01/2021',
	'599.99',
	'1',
	'1',
	'7',
	'2',
	'2'
),(
	'04/22/2021',
	'9999.99',
	'5',
	'3',
	'9',
	'3',
	'3'
	
),(
	'04/28/2021',
	'299.99',
	'2',
	'2',
	'8',
	'4',
	'1'
	
);


SELECT *
FROM car


--Invoice for car purchases
INSERT INTO invoice(
	date_invoice,
	total_amount, 
	vin,
	salesperson_id,
	customer_id	
)VALUES(
	'04/11/2021',
	'173000.00',
	'1N4AL11D96C260042',
	'7',
	'3'
),(
	'02/28/2021',
	'72990.00',
	'TRUWT28N011046197',
	'9',
	'1'
);


--Insert purchases for car parts only
INSERT INTO invoice(
	date_invoice,
	total_amount,
	part_id,
	salesperson_id,
	customer_id
)VALUES(
	'01/01/2021',
	'25.99',
	'3',
	'8',
	'1'
);



