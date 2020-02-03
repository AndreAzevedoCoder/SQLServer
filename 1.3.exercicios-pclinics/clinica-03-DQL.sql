CREATE DATABASE veterinariaManha

GO

USE veterinariaManha

GO

CREATE TABLE clinica(
	idClinica INT PRIMARY KEY IDENTITY,
	Endereco VARCHAR(200)
);

GO

CREATE TABLE dono(
	idDono INT PRIMARY KEY IDENTITY,
	nome VARCHAR(200),
	pet INT FOREIGN KEY REFERENCES pets (IdPet)
);

GO

CREATE TABLE pets(
	idPet INT PRIMARY KEY IDENTITY,
	nome VARCHAR(200),
	dataDeNascimento DATE,
	tipo VARCHAR(200),
	raca VARCHAR(200),
);

CREATE TABLE Veterinario (
	idVeterinario INT PRIMARY KEY IDENTITY,
	nome VARCHAR(200),
);

CREATE TABLE atendimento (
	idAtendimento INT PRIMARY KEY IDENTITY,
	idVeterinario INT FOREIGN KEY REFERENCES veterinario (idVeterinario),
	idDono INT FOREIGN KEY REFERENCES dono (idDono),
	situacao VARCHAR(200)
);
GO

INSERT INTO clinica (Endereco)
VALUES('rua joao avelao pinhao melao')

INSERT INTO pets(nome,dataDeNascimento,tipo,raca)
VALUES('princesa','15/06/2002','pequeno','Yorkshire')

INSERT INTO dono(nome, pet)
VALUES('ricardao', 1)

INSERT INTO Veterinario(nome)
VALUES('veterinario')

INSERT INTO atendimento(idVeterinario,idDono,situacao)
VALUES(1,1,'Atendimento feito, tudo certo')
