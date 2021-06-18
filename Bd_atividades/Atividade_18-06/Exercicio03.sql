-- ATIVIDADE 3

CREATE DATABASE db_escola;

USE  db_escola;

CREATE TABLE tb_alunos(
	id_alunos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_aluno VARCHAR(200) NOT NULL,
	materia VARCHAR(100) NOT NULL,
	turma VARCHAR(100) NOT NULL,
	nota FLOAT(2,1) NOT NULL
);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Lucas Cruz', 'Português','3°B',8);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Geovanne Lima', 'História','1°G', 5);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Carla Oliveira', 'Artes','8°C', 10);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Pedro Sampaio', 'Geográfia','3°C', 7.5);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Aline Dionizio', 'Matemática','2°E', 6.5);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Tamires Fonçeca', 'Sociologia','2°A', 8);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Gabriela Silva', 'Português','3°A', 9);

INSERT INTO tb_alunos(nome_aluno, materia, turma,nota)VALUES('Pedro Silva', 'Artes','1°A', 4);

SELECT * FROM `tb_alunos` WHERE nota > 7;

SELECT * FROM `tb_alunos` WHERE nota < 7;

UPDATE tb_alunos SET nome_aluno = 'Fabiano Pereira', materia = 'Geográfia', turma = '1ºC', nota = 9 WHERE id_alunos = 4;
