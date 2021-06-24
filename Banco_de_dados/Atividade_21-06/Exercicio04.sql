CREATE DATABASE db_cidade_das_frutas;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Vegetal','Frutas','Legumes') NOT NULL,
    organico BOOLEAN NOT NULL
);

INSERT INTO tb_categoria(tipo,organico)VALUES('Vegetal', 1);
INSERT INTO tb_categoria(tipo,organico)VALUES('Vegetal', 0);
INSERT INTO tb_categoria(tipo,organico)VALUES('Frutas', 0);
INSERT INTO tb_categoria(tipo,organico)VALUES('Legumes', 1);
INSERT INTO tb_categoria(tipo,organico)VALUES('Legumes', 0);

CREATE TABLE tb_produtos(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
	qtd_estoque INT NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    orta_origem VARCHAR(255) NOT NULL,
    fk_categoria_produto INT NOT NULL,
    FOREIGN KEY(fk_categoria_produto) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Alface', 50 , 3.90 , 'São José', 1);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Agrião', 22 , 2.50 , 'São Pedro', 2);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Mandioca', 22 , 4.50 , 'São José', 4);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Beterraba', 12 , 2.90 , 'São José', 5);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Cenoura', 80 , 1.90 , 'São Paulo', 5);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Espinafre', 10 , 2.89 , 'São José', 2);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Morango', 50 , 4.00 , 'São José', 3);
INSERT INTO tb_produtos(nome_produto, qtd_estoque, preco, orta_origem, fk_categoria_produto)VALUES('Banana', 110 , 4.50 , 'São Pedro', 3);

SELECT * FROM tb_produtos WHERE preco >= 4;
SELECT * FROM tb_produtos WHERE preco BETWEEN 2 AND 4;
SELECT * FROM tb_produtos WHERE nome_produto LIKE 'c%';

SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria_produto;
SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria_produto WHERE tipo = 'Legumes';