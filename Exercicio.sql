-- Cria o banco de dados com o nome Gufi
CREATE DATABASE Gufi_Manha;
GO

-- Define o banco de dados que será utilizado
USE Gufi_Manha;
GO

-- Criação das tabelas
CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY
	,TituloTipoUsuario VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE TipoEvento (
	IdTipoEvento INT PRIMARY KEY IDENTITY
	,TituloTipoEvento VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Instituicao (
	IdInstituicao INT PRIMARY KEY IDENTITY
	,CNPJ CHAR(14) NOT NULL UNIQUE
	,NomeFantasia VARCHAR (255) NOT NULL UNIQUE
	,Endereco VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY IDENTITY
	,Nome VARCHAR (255) NOT NULL
	,Email VARCHAR (255) NOT NULL UNIQUE
	,Senha VARCHAR (255) NOT NULL
	,DataCadastro DATETIME2 
	,Genero VARCHAR (255)
	,IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);
GO

EXEC sp_rename 'Usuario.IdTipousuario' , 'IdTipoUsuario' , 'COLUMN'

CREATE TABLE Evento (
	IdEvento INT PRIMARY KEY IDENTITY
	,NomeEvento VARCHAR (255) NOT NULL
	,DataEvento DATETIME2 NOT NULL
	,Descricao VARCHAR (255) NOT NULL
	,AcessoLivre BIT DEFAULT (1) NOT NULL
	,IdInstituicao INT FOREIGN KEY REFERENCES Instituicao (IdInstituicao)
	,IdTipoEvento INT FOREIGN KEY REFERENCES TipoEvento (IdTipoEvento)
);
GO

CREATE TABLE Presenca (
	IdPresenca INT PRIMARY KEY IDENTITY
	,IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
	,IdEvento INT FOREIGN KEY REFERENCES Evento (IdEvento)
	,Situacao VARCHAR (255) NOT NULL
);
GO

INSERT INTO TiposUsuario(tipoUsuaruio)
VALUES('Administrador'),
('Comum')


INSERT INTO TipoEvento(TituloTipoEvento)
VALUES('C#'),
('React'),
('SQL');

INSERT INTO Usuario(Nome,Email,Senha,DataCadastro,Genero,IdTipoUsuario)
VALUES('admin','adm@gmail.com','adm123','06/02/2020','Não informado',1),
('Carol','carol@email.com','carol123','06/02/2020','Feminino',2),
('Saulo','saulo@email.com','saulo123','06/02/2020','Masculino',2);

INSERT INTO Evento(IdTipoEvento,IdInstituicao,NomeEvento,AcessoLivre,DataEvento,Descricao)
VALUES(1,1,'Orientação a objetos',1,'07/02/2020','Conceitos sobre os pilares da programação orientada a objeto'),
(2,1,'Ciclo da vida',0,'08/02/2020','Como utilizar os ciclos da vida com a biblioteca ReactJS'),
(3,1,'Introdução a SQL',1,'09/02/2020','Comandos basicos utilizando SQL Server');

INSERT INTO Presenca(IdUsuario,IdEvento,Situacao)
VALUES(15,2,'Confirmada'),
(16,3,'Não confirmada'),
(17,1,'Confirmada');


SELECT IdUsuario,Nome,Email,Senha,DataCadastro,Genero,tipoUsuaruio FROM Usuario
INNER JOIN TiposUsuario ON Usuario.IdTipoUsuario = TiposUsuario.idTiposUsuario;


SELECT * FROM Instituicao;


SELECT TituloTipoEvento AS Tipos_De_Evento FROM TipoEvento


SELECT NomeEvento AS Nome_Do_Evento, DataEvento AS Data_Evento,Descricao,AcessoLivre AS Acesso_Livre, Instituicao.nomeFantasia AS Instituicao,TipoEvento.TituloTipoEvento AS Tipo_De_Evento FROM Evento
INNER JOIN Instituicao ON Instituicao.idInstituicao = Evento.IdInstituicao 
INNER JOIN TipoEvento ON  TipoEvento.IdTipoEvento = Evento.IdTipoEvento


SELECT NomeEvento AS Nome_Do_Evento, DataEvento AS Data_Evento,Descricao,AcessoLivre AS Acesso_Livre, Instituicao.nomeFantasia AS Instituicao,TipoEvento.TituloTipoEvento AS Tipo_De_Evento FROM Evento
INNER JOIN Instituicao ON Instituicao.idInstituicao = Evento.IdInstituicao 
INNER JOIN TipoEvento ON  TipoEvento.IdTipoEvento = Evento.IdTipoEvento
WHERE AcessoLivre = 1


SELECT Nome,Situacao,NomeEvento,DataEvento,Descricao,AcessoLivre ,nomeFantasia,endereco,CNPJ,TituloTipoEvento FROM Presenca
INNER JOIN Usuario ON Usuario.IdUsuario = Presenca.IdUsuario
INNER JOIN Evento ON Evento.IdEvento = Presenca.IdEvento
INNER JOIN Instituicao ON Instituicao.idInstituicao = Evento.IdInstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento
WHERE Usuario.IdUsuario = 16


SELECT Nome,Situacao,NomeEvento,DataEvento,Descricao,CASE AcessoLivre WHEN 0 THEN 'Restrito' WHEN 1 THEN 'Livre' END AS Restricao,nomeFantasia,endereco,CNPJ,TituloTipoEvento FROM Presenca
INNER JOIN Usuario ON Usuario.IdUsuario = Presenca.IdUsuario
INNER JOIN Evento ON Evento.IdEvento = Presenca.IdEvento 
INNER JOIN Instituicao ON Instituicao.idInstituicao = Evento.IdInstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento
WHERE Usuario.IdUsuario = 16


SELECT Nome,Situacao,NomeEvento,DataEvento,Descricao,CASE AcessoLivre WHEN 0 THEN 'Restrito' WHEN 1 THEN 'Livre' END AS Restricao,nomeFantasia,endereco,CNPJ,TituloTipoEvento FROM Presenca
INNER JOIN Usuario ON Usuario.IdUsuario = Presenca.IdUsuario
INNER JOIN Evento ON Evento.IdEvento = Presenca.IdEvento 
INNER JOIN Instituicao ON Instituicao.idInstituicao = Evento.IdInstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento
WHERE Situacao = 'Confirmada'
