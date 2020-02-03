CREATE DATABASE locadoraManha 

USE locadoraManha

CREATE TABLE veiculos (
	idVeiculo INT PRIMARY KEY IDENTITY,
	marca VARCHAR(200),
	modelo VARCHAR(200),
	placa VARCHAR(200)
);

GO

CREATE TABLE cliente (
	idCliente INT PRIMARY KEY IDENTITY ,
	cpf INT NOT NULL,
	nome VARCHAR(200) NOT NULL,
);


CREATE TABLE Aluguel(
	idAluguel INT PRIMARY KEY IDENTITY,
	idCliente INT FOREIGN KEY REFERENCES cliente (idCliente),
	idVeiculo INT FOREIGN KEY REFERENCES veiculos (idVeiculo)
);


INSERT INTO cliente(cpf,nome)
VALUES('1231240404','EU');


INSERT INTO veiculos(marca,modelo,placa)
VALUES('Chevrolet','Onix','ABA-123')

INSERT INTO Aluguel(idCliente,idVeiculo)
VALUES(1,1)

SELECT * FROM Aluguel
SELECT * FROM cliente
SELECT * FROM veiculos
