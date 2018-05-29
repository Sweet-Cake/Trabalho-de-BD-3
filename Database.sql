CREATE DATABASE avaliacoes
GO
USE avaliacoes

CREATE TABLE aluno(
ra INT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
)

CREATE TABLE disciplina(
codigo INT NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
sigla VARCHAR(6) NOT NULL,
turno VARCHAR(1) NOT NULL,
num_aulas INT NOT NULL
)

CREATE TABLE avaliacao(
codigo INT NOT NULL PRIMARY KEY,
tipo VARCHAR(2) NOT NULL,
)

CREATE TABLE notas(
ra_aluno INT NOT NULL FOREIGN KEY REFERENCES aluno(ra),
codigo_disciplina INT NOT NULL FOREIGN KEY REFERENCES disciplina(codigo),
codigo_avaliacao INT NOT NULL FOREIGN KEY REFERENCES avaliacao(codigo),
nota DECIMAL(2, 2) NOT NULL,
PRIMARY KEY (ra_aluno, codigo_disciplina, codigo_avaliacao)
)

CREATE TABLE faltas(
ra_aluno INT NOT NULL FOREIGN KEY REFERENCES aluno(ra),
codigo_disciplina INT NOT NULL FOREIGN KEY REFERENCES disciplina(codigo),
data DATETIME NOT NULL,
presensa INT NOT NULL,
PRIMARY KEY(ra_aluno, codigo_disciplina, data)
)

INSERT INTO disciplina VALUES
(4203010, 'Arquitetura e Organização de Computadores', 'IAC001', 'T', 80),
(4203020, 'Arquitetura e Organização de Computadores', 'IAC001', 'N', 80),
(4208010, 'Laboratório de Hardware', 'IHW100', 'T', 40),
(4226004, 'Banco de Dados', 'IBD002', 'T', 80),
(4213003, 'Sistemas Operacionais I', 'ISO100', 'T', 80),
(4213013, 'Sistemas Operacionais I', 'ISO100', 'N', 80),
(4233005, 'Laboratório de Banco de Dados', 'IBD100', 'T', 80),
(5005220, 'Métodos Para a Produção do Conhecimento', 'TTG100', 'T', 40)

INSERT INTO avaliacao VALUES
(1, 'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'T'),
(5, 'E')