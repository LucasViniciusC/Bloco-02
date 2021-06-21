-- ATIVIDADE 1

CREATE DATABASE db_sistema_rh;

USE db_sistema_rh;

CREATE TABLE tb_funcionario(
	id_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	funcao  VARCHAR(100)  NOT NULL,
	setor VARCHAR(100) NOT NULL,
	salario FLOAT(8,2) NOT NULL
);

INSERT INTO tb_funcionario(nome, setor, funcao, salario)VALUES('Lucas Cruz', 'Expedição','Conferente',1280.00);

INSERT INTO tb_funcionario(nome, setor, funcao, salario)VALUES('Luana Fidalgo', 'Vendas','Análista de contratos',2500.00);

INSERT INTO tb_funcionario(nome, setor, funcao, salario)VALUES('Pedro Campos', 'Labora´tório','Gestos da Qualidade Jr',1800.00);

INSERT INTO tb_funcionario(nome, setor, funcao, salario)VALUES('Máricia Lopez', 'Finánceiro','Gerente de Finanças',5800.00);

INSERT INTO tb_funcionario(nome, setor, funcao, salario)VALUES('Otávio José', 'Expedição','Ajudade Geral',1000.00);

SELECT * FROM tb_funcionario WHERE salario > 2000.00;

SELECT * FROM tb_funcionario WHERE salario < 2000.00;

UPDATE tb_funcionario SET nome = 'Bianca Lacerda', funcao = 'Vendedora', setor = 'Vendas', salario = 2100.00 WHERE id_funcionario = 2;


