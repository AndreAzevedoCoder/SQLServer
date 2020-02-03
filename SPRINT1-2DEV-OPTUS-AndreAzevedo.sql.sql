CREATE DATABASE OptusManhaNovamente;

USE OptusManhaNovamente

	CREATE TABLE tiposUsuario
		(
			idTipoUsuario		INT PRIMARY KEY IDENTITY ,
			Titulo				VARCHAR(255)
		);

	CREATE TABLE Artistas
		(
			IdArtista			INT PRIMARY KEY IDENTITY,
			Titulo				VARCHAR(200)
		);

	CREATE TABLE Estilos
		(
			IdEstilos			INT PRIMARY KEY IDENTITY,
			NomeEstilo			VARCHAR(200)
		);

	CREATE TABLE Usuarios
		(
			IdUsuarios			INT PRIMARY KEY IDENTITY,
			Nome				VARCHAR(200),
			idTipoUsuario		INT FOREIGN KEY REFERENCES tiposUsuario (idTipoUsuario)
		);

	CREATE TABLE Albuns
		(
			IdAlbum				INT PRIMARY KEY IDENTITY,
			Nome				VARCHAR(200),
			DataLancamento		VARCHAR(200),
			QtdMinutos			VARCHAR(200),
			Visualizacao		VARCHAR(200),
			IdArtista           INT FOREIGN KEY REFERENCES Artistas (IdArtista),
			IdEstilos			INT FOREIGN KEY REFERENCES Estilos (IdEstilos)
		);


INSERT INTO tiposUsuario (Titulo)
VALUES ('ADM'),
	   ('USUARIO COMUM');


INSERT INTO tiposUsuario (Titulo)
VALUES ('Fabio');


INSERT INTO Artistas (Titulo)
VALUES ('´Slipknot'),
	   ('Ghostemane'),
	   ('Billie Eilish'),
	   ('Korn'),
	   ('Avioes do forro');


INSERT INTO Estilos (NomeEstilo)
VALUES ('Metal'),
	   ('Heavy Metal'),
	   ('Cringe'),
	   ('indie'),
	   ('Rock');

INSERT INTO Usuarios (Nome, idTipoUsuario)
VALUES ('Admin', 1),
	   ('Cleiton', 2),
	   ('Cleverson', 2),
	   ('Cratos', 2),
	   ('Cliuton', 2);


INSERT INTO Albuns (Nome, IdArtista, IdEstilos, DataLancamento, QtdMinutos, Visualizacao)
VALUES ('All hope is gone', 1, 1, '01/01/2001', 343, 171345),
	   ('Hexada', 2, 2, '01/01/2001', 343, 113456),
	   ('sup man', 3, 3, '01/01/2001', 143, 13463543),
	   ('many options', 4, 4, '01/01/2001', 6034, 2321),
	   ('options prime', 5, 5, '01/01/2001', 346, 1343146);


SELECT * FROM tiposUsuario;
SELECT * FROM Artistas;
SELECT * FROM Estilos;
SELECT * FROM Usuarios;
SELECT * FROM Albuns;


SELECT * FROM Albuns WHERE IdArtista LIKE 1


SELECT * FROM Albuns WHERE DataLancamento LIKE '01/01/2001'


SELECT Nome FROM Albuns WHERE IdEstilos LIKE 1


SELECT * FROM Albuns ORDER BY DataLancamento DESC


--Exemplo inner join
SELECT * FROM Artistas
INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista




