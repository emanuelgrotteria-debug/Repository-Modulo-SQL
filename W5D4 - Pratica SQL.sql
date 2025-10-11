CREATE DATABASE CONCESSIONARIA;
USE CONCESSIONARIA;

CREATE TABLE Cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR (20),
last_name VARCHAR (20),
email VARCHAR (35)
);

CREATE TABLE Auto (
id_auto INT AUTO_INCREMENT PRIMARY KEY,
modello VARCHAR (30),
marchio VARCHAR (10),
costo DECIMAL (9,2)
);

CREATE TABLE Acquisto (
id_acquisto INT AUTO_INCREMENT PRIMARY KEY,
data_acquisto DATE,
disponibilità VARCHAR (2),
id_cliente INT,
id_auto INT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_auto) REFERENCES Auto (id_auto)
);

CREATE TABLE Seller (
id_seller INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR (20),
last_name VARCHAR (20),
id_auto INT,
FOREIGN KEY (id_auto) REFERENCES Auto (id_auto)
);
INSERT INTO Cliente (first_name, last_name, email) VALUES
('Emanuel', 'Grotteria', 'emagrotteria@gmail.com'),
('Alessio', 'Piperis', 'alessiopip@gmail.com'),
('Chiara', 'Zizza', 'chizizza@gmail.com');
INSERT INTO Auto (marchio, modello, costo) VALUES
('Audi', 'Q3', '36000.00'),
('Alfa Romeo', 'Giulia', '35000.00'),
('Mercedes', 'Cla', '40000.00');
INSERT INTO Acquisto (data_acquisto, disponibilità, id_cliente, id_auto) VALUES
('30-10-2025', 'si', 1, 1),
('30-10-2025', 'no', 2, 2),
('21-02-2025', 'si', 3, 3);
INSERT INTO Seller (first_name, last_name, id_auto) VALUES
('Giulio', 'Rossi', 1),
('Andrea', 'Bianchi', 2),
('Michelle', 'Amato', 3);

SELECT * FROM Cliente;
