--Create customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(50),
	phone_number VARCHAR(15)
);

--Create table for vendor
CREATE TABLE vendor(
	vendor_id SERIAL PRIMARY KEY,
	vendor_name VARCHAR(50),
	phone_number VARCHAR(15),
	address VARCHAR(100)
);

--Create table for Salesperson
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

--Create table for part
CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR(255),
	amount NUMERIC(7,2),
	SKU VARCHAR(20),
	vendor_id INTEGER NOT NULL,
	FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id)
);


--Create table for car 
CREATE TABLE car(
	VIN VARCHAR(20) NOT NULL PRIMARY KEY,
	model VARCHAR(50),
	year_car VARCHAR(4),
	color VARCHAR(15),
	amount NUMERIC(8,2),
	vendor_id INTEGER NOT NULL,
	FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id)
);

--Create table for mechanic
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

--Create table for service
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	date_service DATE,
	description VARCHAR(255),
	amount NUMERIC(7,2)
);


--Create table for invoice
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	date_invoice TIMESTAMP,
	total_amount NUMERIC(8,2),
	VIN VARCHAR(20),
	FOREIGN KEY(vin) REFERENCES car(vin),
	part_id INTEGER,
	FOREIGN KEY(part_id) REFERENCES part(part_id),
	service_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	mechanic_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)	
);




