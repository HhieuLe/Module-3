CREATE DATABASE banking_manager;
USE banking_manager;
CREATE TABLE customers(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fullname VARCHAR(40),
	age TINYINT,
	balance DOUBLE
);

CREATE TABLE deposits(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id INT NOT NULL,
	amount DOUBLE,
    deposits_time DATETIME,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE withdraws(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id INT NOT NULL,
	amount DOUBLE,
    withdraws_time DATETIME,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE transfers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
deposits_id INT NOT NULL,
withdraws_id INT NOT NULL,
amount DOUBLE,
fee DOUBLE,
transfers_time DATETIME,
FOREIGN KEY (deposits_id) REFERENCES customers(id)
);

