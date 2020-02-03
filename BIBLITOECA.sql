CREATE DATABASE livrosManha

Use livrosManha

CREATE TABLE generos (
	idGenero INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(200)
)

CREATE TABLE autores (
	idAutor INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(200)
)

CREATE TABLE livros (
	idLivro INT PRIMARY KEY IDENTITY,
	idGenero INT FOREIGN KEY REFERENCES generos (idGenero) NOT NULL,
	idAutor INT FOREIGN KEY REFERENCES autores (idAutor) NOT NULL,
	titulo VARCHAR(200)
);

SELECT * FROM autores
SELECT * FROM livros
SELECT * FROM generos

INSERT INTO autores(nome)
VALUES('Alfred Angelo Attanasio'),
('A. Trevor Thrall'),
('Aaron Ross Powell'),
('Adam B. Schaeffer'),
('Adam Ferguson');

INSERT INTO generos(nome)
VALUES('Ficção cientifica'),
('Filosofia Politica'),
('Ciencia Politica'),
('Sociologia'),
('Historia Politica');

INSERT INTO Livros(titulo,idGenero,idAutor)
VALUES('Solis',1,1),
('Fuel to the Fire: How Trump Made America’s Broken Foreign Policy Even Worse (and How We Can Recover)',2,5),
('Individualism: A Reader',3,2),
('Arguments for Liberty',3,2),
('Death by Gun Control The Human Cost of Victim Disarmamen',2,2);