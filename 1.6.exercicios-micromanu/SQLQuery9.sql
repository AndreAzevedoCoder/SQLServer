CREATE DATABASE micromanuManha
USE micromanuManha

CREATE TABLE colaborador (
	idColaborador INT PRIMARY KEY IDENTITY,
	nome VARCHAR(200),
	salario INT,
);
INSERT INTO colaborador(nome,salario)
VALUES('Erik',1000),
('Claudio',1000),
('Daniel',1500);

CREATE TABLE itens(
	idItem INT PRIMARY KEY IDENTITY,
	descricao VARCHAR(200)
);

INSERT INTO itens(descricao)
VALUES('Computador'),
('Notebook'),
('Televisão'),
('Celular');

CREATE TABLE pedidosColaboradores(
	idPedido INT PRIMARY KEY IDENTITY,
	idColaborador INT FOREIGN KEY REFERENCES colaborador (idColaborador)
);

CREATE TABLE clientes(
	idCliente INT PRIMARY KEY IDENTITY,
	nome VARCHAR(200),
);

INSERT INTO clientes(nome)
VALUES('Saulo'),
('Carol');

CREATE TABLE tipoConserto(
	idTipo INT PRIMARY KEY IDENTITY,
	descricao VARCHAR(200)
);

INSERT INTO tipoConserto(descricao)
VALUES('Manutenção'),
('Limpeza');

CREATE TABLE pedidos (
	idPedido INT PRIMARY KEY IDENTITY,
	idCliente INT FOREIGN KEY REFERENCES clientes (idCliente),
	idItem INT FOREIGN KEY REFERENCES itens (idItem),
	idTipo INT FOREIGN KEY REFERENCES tipoConserto(idTipo),
	numeroEquipamento INT,
	entrada DATE,
	saida DATE
);

INSERT INTO pedidos(idCliente,idItem,idTipo,numeroEquipamento,entrada,saida)
VALUES(1,1,1,215,'15/06/2002','03/02/2020')

SELECT numeroEquipamento,entrada,saida,itens.descricao AS DescricaoItem,tipoConserto.descricao AS DescricaoConserto,clientes.nome AS Cliente
FROM pedidos
INNER JOIN itens ON pedidos.idItem = itens.idItem
INNER JOIN tipoConserto ON pedidos.idTipo = tipoConserto.idTipo
INNER JOIN clientes ON pedidos.idCliente = clientes.idCliente