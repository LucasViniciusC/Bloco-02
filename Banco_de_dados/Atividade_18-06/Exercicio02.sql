-- ATIVIDADE 2

CREATE DATABASE db_ecommerce;

USE db_ecommerce ;

CREATE TABLE tb_produtos(
	id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_produto VARCHAR(100) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	categoria VARCHAR(100)  NOT  NULL,
    valor FLOAT(8,2)
);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('Controle PS4','Controle Original do PS4','Games',299.00);

INSERT INTO tb_produtos(nome_produto, descricao, categoria,valor)VALUES('Bicicleta', 'Bicicleta Aro 18 Esportiva', 'Esportes', 750.00);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('Smartphone', 'Smartphone LG 6.0 Polegadas Octa Core 64GB','Celulares',3500.00);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('NoteBook','NoteBook Dell 22 Polegadas Intel Core i5 250GB','Tecnólogia',4800.00 );

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('Mouse Pad', 'Mouse Pad Redragon RGB','Perifericos',120.00);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('MEMÓRIA RAM 8GB DDR3', 'Memória RAM 8GB DDR3 Cosair','Hardware',230.00);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('Lâmpada Inteligente ', 'Lâmpada Inteligente Elgin','Casa',99.90);

INSERT INTO tb_produtos(nome_produto, descricao, categoria, valor)VALUES('WebCam', 'WebCam Redragon Fobos HD 720 P','Perifericos',390.50);

SELECT * FROM `tb_produtos` WHERE valor > 500;

SELECT * FROM `tb_produtos` WHERE valor < 500;

UPDATE tb_produtos SET nome_produto = 'Caixa de som', descricao = 'Caixa de som JBL Bluetooth com Báteria estendida', categoria = 'Som e Áudio', valor = 480.00 WHERE id_produto = 4;


