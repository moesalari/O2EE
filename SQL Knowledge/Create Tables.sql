--USE DATABASENAME
--GO
/* This script will remove tables - Warning! data might be lost*/
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS provinces;
DROP TABLE IF EXISTS employeerecentaddress;

CREATE TABLE  addresses
(
	addressid int PRIMARY KEY,
	employeeid int,
	address varchar(20),
	city varchar(20),
	provinceid int,
	postalcode varchar(10),
	moveindate date
	
);

CREATE TABLE  employees
(
	employeeid int PRIMARY KEY,
	firstname varchar(20),
	lastname varchar(20)
	
);

CREATE TABLE  provinces
(
	provinceid int PRIMARY KEY,
	province varchar(20)

);
--we will put final result into below tables
CREATE TABLE employeerecentaddress
(
	employeeid int PRIMARY KEY,
	firstname varchar(20),
	lastname varchar(20),
	address varchar(20),
	city varchar(20),
	province varchar(20),
	postalcode varchar(10),
	moveindate date
)