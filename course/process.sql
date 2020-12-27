-- Creating database
create database hardware_shop;

-- Creating tables
create table client (
	client_id serial primary key,
	first_name varchar(50) not null,
	second_name varchar(50) not null,
	phone_number varchar(50),
	email_address varchar(50)
);

create table employee (
	employee_id serial primary key,
	first_name varchar(50) not null,
	second_name varchar(50) not null,
	title varchar(50) not null,
	phone_number varchar(50) not null,
	email_address varchar(50) not null,
	home_address varchar(50) not null,
	date_of_birth varchar(50) not null
);

create table categories (
	category_id serial primary key,
	name varchar(50) not null,
	description varchar(50) not null
);

create table manufacturer (
	manufacturer_id serial primary key,
	name varchar(50) not null,
	location varchar(50) not null,
	email_address varchar(50) not null,
	phone_number varchar(50) not null,
	web_page varchar(50) not null
);

create table hardware (
	hardware_id serial primary key,
	category_id smallint not null references categories(category_id) on delete cascade,
	manufacturer_id smallint not null references manufacturer(manufacturer_id) on delete cascade,
	name varchar(50) not null,
	color varchar(50) not null,
	material_type varchar(50) not null,
	connection_type varchar(50) not null,
	size varchar(50) not null,
	weight varchar(50) not null,
	description varchar(200)
);

create table warehouse (
	warehouse_id smallint primary key,
	hardware_id smallint unique references hardware(hardware_id) on delete cascade,
	unit_price real not null,
	units_in_stock int not null
);

create table "order" (
	order_id serial primary key,
	client_id smallint not null references client(client_id) on delete cascade,
	employee_id smallint not null references employee(employee_id) on delete cascade,
	hardware_warehouse smallint not null references warehouse(warehouse_id) on delete cascade,
	order_date varchar(50) not null
);

create table order_details (
	order_id smallint not null references "order"(order_id) on delete cascade,
	hardware_id smallint not null references warehouse(warehouse_id) on delete cascade,
	quantity int not null, 
	discount real not null
);

-- Inserting values
-- client
insert into client (first_name, second_name, phone_number, email_address) values ('Caye', 'Tootal', '+420 (964) 177-1667', 'ctootal0@shop-pro.jp');
insert into client (first_name, second_name, phone_number, email_address) values ('Biron', 'Penticoot', '+86 (828) 583-5643', 'bpenticoot1@fda.gov');
insert into client (first_name, second_name, phone_number, email_address) values ('Amerigo', 'McKitterick', '+98 (820) 568-4051', 'amckitterick2@shutterfly.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Anna-maria', 'Lemm', '+62 (743) 872-9887', 'alemm3@icio.us');
insert into client (first_name, second_name, phone_number, email_address) values ('Rosemaria', 'Stonman', '+375 (768) 756-1859', 'rstonman4@xrea.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Felicdad', 'Larmour', '+86 (333) 193-4930', 'flarmour5@dailymotion.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Koren', 'Keuntje', '+86 (291) 386-2420', 'kkeuntje6@amazon.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Tamiko', 'Hasselby', '+7 (757) 718-6287', 'thasselby7@godaddy.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Ammamaria', 'Tuvey', '+86 (817) 312-1740', 'atuvey8@timesonline.co.uk');
insert into client (first_name, second_name, phone_number, email_address) values ('Carlene', 'Osboldstone', '+63 (206) 868-6855', 'cosboldstone9@japanpost.jp');
insert into client (first_name, second_name, phone_number, email_address) values ('Caria', 'Petofi', '+46 (874) 539-4979', 'cpetofia@arizona.edu');
insert into client (first_name, second_name, phone_number, email_address) values ('Dianne', 'Sharper', '+380 (544) 481-1499', 'dsharperb@engadget.com');
insert into client (first_name, second_name, phone_number, email_address) values ('Durante', 'Gostling', '+7 (256) 880-2550', 'dgostlingc@smh.com.au');
insert into client (first_name, second_name, phone_number, email_address) values ('Malvin', 'Backes', '+51 (424) 179-3473', 'mbackesd@de.vu');
insert into client (first_name, second_name, phone_number, email_address) values ('Cherie', 'Sidnell', '+86 (292) 273-4307', 'csidnelle@shinystat.com');

-- employee
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Joey', 'Caesar', 'Mrs', '+86 (976) 913-5724', 'jcaesar0@technorati.com', '4 Hoffman Trail', '1994-07-30');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Milo', 'Soans', 'Rev', '+352 (669) 329-4455', 'msoans1@geocities.com', '59271 Sugar Hill', '1999-10-12');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Wang', 'Reasun', 'Mr', '+86 (891) 446-2835', 'wreasun2@bigcartel.com', '60 Weeping Birch Plaza', '2000-12-22');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Jacintha', 'Aronoff', 'Mrs', '+48 (534) 963-1547', 'jaronoff3@mapy.cz', '721 Holmberg Parkway', '1998-08-10');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Hall', 'Purdy', 'Ms', '+86 (639) 676-9662', 'hpurdy4@msn.com', '866 Arrowood Alley', '1999-12-29');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Morgan', 'Lugden', 'Mr', '+62 (998) 938-6113', 'mlugden5@merriam-webster.com', '7934 Doe Crossing Parkway', '1999-05-07');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Aleen', 'Hilbourne', 'Dr', '+57 (929) 561-4973', 'ahilbourne6@last.fm', '89736 Linden Circle', '1994-12-24');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Saraann', 'Weighell', 'Honorable', '+62 (866) 781-5767', 'sweighell7@mapquest.com', '553 Mariners Cove Avenue', '1996-05-15');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Daisy', 'Rubinivitz', 'Mr', '+855 (736) 219-8339', 'drubinivitz8@smugmug.com', '1166 Cottonwood Court', '2002-09-26');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Bernadene', 'Challener', 'Mrs', '+62 (500) 384-5222', 'bchallener9@yolasite.com', '06 Corry Terrace', '1996-12-15');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Benny', 'Bendan', 'Honorable', '+48 (209) 908-3721', 'bbendana@sourceforge.net', '8 Norway Maple Road', '1995-01-13');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Margi', 'Lumpkin', 'Honorable', '+63 (713) 712-2053', 'mlumpkinb@nationalgeographic.com', '7999 Walton Center', '2001-08-04');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Hamish', 'Verrico', 'Rev', '+86 (272) 400-9652', 'hverricoc@desdev.cn', '21039 Sachs Crossing', '1996-07-23');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Corene', 'Hitschke', 'Ms', '+381 (473) 682-5475', 'chitschked@buzzfeed.com', '116 Lake View Alley', '1995-03-13');
insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('Gabrila', 'McKnish', 'Rev', '+51 (747) 661-7187', 'gmcknishe@diigo.com', '0 Talmadge Center', '1996-08-05');

-- categories
insert into categories (name, description) values ('Computer Headphones','Devices for listening to recordings');
insert into categories (name, description) values ('Computer Microphones','Sound recording devices');
insert into categories (name, description) values ('Monitor screens','Graphical display devices');
insert into categories (name, description) values ('Computer Keyboards','Text input devices');
insert into categories (name, description) values ('Computer Mouses','Pointing input devices');

-- manufacturer
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Connelly-Friesen', '38300 Kropf Lane', 'dmeaney0@rambler.ru', '+351 696 392 8915', 'flavors.me');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Blanda Group', '5 Lerdahl Terrace', 'ocleynman1@lycos.com', '+502 561 292 6016', 'skyrock.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Nienow, Hayes and Stracke', '7418 Nova Pass', 'nsemour2@google.com.hk', '+86 843 863 1612', 'auda.org.au');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Kirlin, Baumbach and Johnston', '08 Eagan Junction', 'ugarwood3@linkedin.com', '+55 645 937 0467', 'fastcompany.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Leffler, Rath and Pacocha', '41 Dorton Parkway', 'dwinn4@java.com', '+46 303 782 0026', 'sphinn.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Collins LLC', '448 Ruskin Trail', 'nharrigan5@constantcontact.com', '+1 960 200 4759', 'collins.co.uk');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Kemmer-Bergnaum', '1 Dunning Court', 'rogilby6@over-blog.com', '+57 536 617 0555', 'kemmer.co.uk');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Gorczany, Kutch and Rau', '535 Sachs Park', 'mbenaine7@taobao.com', '+86 858 778 3167', 'gorczany.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Heathcote, Swift and Connelly', '7 Carberry Hill', 'pgamage8@nature.com', '+86 736 413 0813', 'heathcote.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Beier-Schinner', '7 Farwell Center', 'rdunning9@nbcnews.com', '+1 325 494 5413', 'beier.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Dooley-Berge', '5320 Carberry Avenue', 'edallemorea@virginia.edu', '+374 960 327 2561', 'economist.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Donnelly-Fahey', '215 Coolidge Drive', 'nwattinhamb@feedburner.com', '+63 714 698 9123', 'cornell.edu');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Homenick-Stiedemann', '3 Manufacturers Crossing', 'roveyc@amazon.co.jp', '+63 428 507 6347', 'homenick.es');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Swift LLC', '289 High Crossing Parkway', 'mmcphated@home.pl', '+231 919 389 1087', 'networksolutions.com');
insert into manufacturer (name, location, email_address, phone_number, web_page) values ('Dare LLC', '39 Erie Court', 'gvowlese@g.co', '+7 269 686 5371', 'fema.gov');

-- hardware 
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (5, 2, 'DeathAdder V2 Gaming Mouse', 'golden', 'metal', 'cable', 'large', 2, 'Large mouse for true gamers.');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (2, 2, 'SUDOTACK Condenser ', 'black', 'metal', 'wireless', 'medium', 1, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (4, 2, 'FENIFOX Slim 2.4G', 'red', 'metal', 'wireless', 'large', 7, 'Mechanical game-device for people without limits');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (4, 3, 'Computer Office Keyboard', 'green', 'metal', 'wireless', 'medium', 8, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (3, 9, '65D1KCC1US', 'green', 'metal', 'cable', 'medium', 19, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (5, 1, 'Cimetech 2.4G Slim', 'grey', 'plastic', 'wireless', 'small', 1, 'Ultra precise computer mouse');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 10, 'USB Gaming Headset', 'yellow', 'plastic', 'cable', 'medium', 5, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (3, 9, 'TU87F 32', 'golden', 'metal', 'cable', 'large', 18, '4K 60Hz For low price.');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 10, 'Pro X Gaming Headset ', 'grey', 'plastic', 'cable', 'medium', 4, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 6, 'Full-Sized, Lightweight Long-Cord Headphones', 'golden', 'metal', 'cable', 'medium', 5, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 3, 'Gaming Headset - Black And Blue', 'black', 'plastic', 'cable', 'small', 3, 'Cutting edge device, ultra soft sound.');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 7, 'Hi-Fi On-Ear Headphones with 9-Foot Cord', 'white', 'plastic', 'cable', 'large', 6, 'Best sound for best price!');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (5, 4, 'MM057 2.4G', 'black', 'metal', 'wireless', 'small', 2, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 9, 'bopmen T3', 'white', 'metal', 'wireless', 'medium', 7, '');
insert into hardware (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values (1, 4, 'ZX Series On-Ear Headphones', 'green', 'metal', 'wireless', 'large', 5, 'Next gen expirience for our customers!');

-- warehouse
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (1, 1, 49, 5);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (2, 2, 9, 15);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (3, 3, 29, 3);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (4, 4, 12, 25);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (5, 5, 199, 8);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (6, 6, 19, 7);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (7, 7, 39, 1);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (8, 8, 129, 13);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (9, 9, 28, 15);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (10, 10, 99, 8);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (11, 11, 39, 2);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (12, 12, 49, 5);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (13, 13, 12, 23);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (14, 14, 22, 5);
insert into warehouse (warehouse_id, hardware_id, unit_price, units_in_stock) values (15, 15, 29, 8);

-- order
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (6, 9, 15, '2020-04-10');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (8, 5, 10, '2020-11-11');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (8, 10, 5, '2020-07-03');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (4, 10, 12, '2020-07-23');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (4, 4, 15, '2020-04-12');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (5, 3, 7, '2020-03-20');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (6, 4, 2, '2020-01-11');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (6, 9, 12, '2020-11-14');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (5, 4, 12, '2020-05-18');
insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (9, 1, 9, '2020-10-31');

-- order_details
insert into order_details (order_id, hardware_id, quantity, discount) values (1, 6, 1, 0.7);
insert into order_details (order_id, hardware_id, quantity, discount) values (2, 8, 1, 1);
insert into order_details (order_id, hardware_id, quantity, discount) values (3, 8, 1, 0.8);
insert into order_details (order_id, hardware_id, quantity, discount) values (4, 4, 3, 0.6);
insert into order_details (order_id, hardware_id, quantity, discount) values (5, 4, 1, 1);
insert into order_details (order_id, hardware_id, quantity, discount) values (6, 5, 2, 1);
insert into order_details (order_id, hardware_id, quantity, discount) values (7, 6, 3, 1);
insert into order_details (order_id, hardware_id, quantity, discount) values (8, 6, 3, 1);
insert into order_details (order_id, hardware_id, quantity, discount) values (9, 5, 1, 0.5);
insert into order_details (order_id, hardware_id, quantity, discount) values (10, 9, 3, 0.5);


-- Creating VIEWS
--===============================================================================================
-- Display all items that need restock (CASE + JOIN)
create or replace view items_restock as
select name, description, units_in_stock, 
case
	when units_in_stock >= 5 then 'Do not need restock'
	when units_in_stock < 5 then 'Needs restock'
end needsRestock
from hardware inner join warehouse on hardware.hardware_id = warehouse.hardware_id;

-- Display all clients that have email address or phone number
create or replace view clients_to_contact as
select * from client where email_address is not null or phone_number is not null;

-- Display all people in db (UNION)
create or replace view display_all_people as
select first_name, second_name from client 
union 
select first_name, second_name from employee;
--===============================================================================================


-- Creating SCALAR and TABLE functions
--===============================================================================================
-- Display full price of order
create or replace function order_price(quantity int, price real, discount real)
returns real
language 'plpgsql'
as $$
begin
	return @quantity * @price * @discount;
end;
$$;

-- Display all orders between two dates
create or replace function orders_between(date1 date, date2 date)
returns setof "order"
language 'plpgsql'
as $$
begin
	if date1 = null or date2 = null then return query select * from "order" where order_date = current_date;
	else return query select * from "order" where order_date between date1 and date2;
	end if;
end;
$$;
--===============================================================================================


-- Creating PROCEDURES
--===============================================================================================
-- Insert new client
create or replace function addNewClient(_first_name varchar, _second_name varchar, _phone_number varchar, _email_address varchar)
returns void
language 'plpgsql'
as $$
begin
	insert into client (first_name, second_name, phone_number, email_address) values (_first_name, _second_name, _phone_number, _email_address);
end;
$$;

-- Insert new employee
create or replace function addNewEmployee(_first_name varchar, _second_name varchar, _title varchar, _phone_number varchar, _email_address varchar, _home_address varchar, _date_of_birth date)
returns void
language 'plpgsql'
as $$
begin
	insert into employee (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values (_first_name, _second_name, _title, _phone_number, _email_address, _home_address, _date_of_birth);
end;
$$;
--===============================================================================================

-- Creating TRIGGERS
--===============================================================================================
-- Moving deleted orders to orders_archive table
create table if not exists orders_archive (
	date_of_delete timestamp,
	delete_by text,
	like "order"
);

create or replace function move_to_archive()
returns trigger
language 'plpgsql'
as $$
begin
	insert into orders_archive (order_id, client_id, employee_id, hardware_warehouse, order_date, date_of_delete, delete_by)
		select old.*, statement_timestamp(), session_user;
    return new;
end;
$$

create trigger move_to_archive
before delete on "order"
	for each row execute function move_to_archive();
--===============================================================================================

-- Default value
alter table hardware
alter description set default 'No Description';
