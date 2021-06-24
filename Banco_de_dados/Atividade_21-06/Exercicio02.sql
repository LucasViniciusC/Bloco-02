CREATE DATABASE db_pizzaria_legal;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,		
	tipo ENUM('Doce','Salgada','Vegana','0 Lactose'),
    borda BOOLEAN NOT NULL
);

INSERT INTO tb_categoria(tipo,borda)VALUES('Doce', 0);
INSERT INTO tb_categoria(tipo,borda)VALUES('Salgada', 1);
INSERT INTO tb_categoria(tipo,borda)VALUES('Salgada', 0);
INSERT INTO tb_categoria(tipo,borda)VALUES('Vegana', 0);
INSERT INTO tb_categoria(tipo,borda)VALUES('0 Lactose', 0);

SELECT * FROM tb_categoria;

CREATE TABLE tb_pizza(
	id_pizza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_pizza VARCHAR(255) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    tamanho ENUM('G','M','P') NOT NULL,
    fk_categoria_pizza INT NOT NULL,
    FOREIGN KEY(fk_categoria_pizza) REFERENCES tb_categoria(id_categoria) 
);

INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Toscana', 48.99, 'Linguiça Toscana, coberta de queijo Cebola', 'G', 2);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Nutella e Morango', 43.00, 'Cobertura de Nutella com pedaços de Morango', 'G', 1);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Caipira', 40.99, 'Frango coberto com queijo e Bacon', 'G', 3);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Napolitana', 39.99, 'Queijo Tomate e Mangericão em Pó', 'M', 2);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Quatro queijos', 42.00, 'Mussarela , Parmezão, Cheddar e Gorgonzola', 'G', 3);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Brigadeiro', 35.99, 'Cobertura de Brigadeiro', 'P', 1);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Calabresa', 29.00, 'Linguiça Calabresa coberta com Cebola', 'M', 5);
INSERT INTO tb_pizza(nome_pizza,preco,ingredientes,tamanho,fk_categoria_pizza)VALUES('Alho e vegetais', 25.99, 'Cobertura de Alho, Tomate e Palmito', 'P', 4);

SELECT * FROM tb_pizza WHERE preco > 45;

SELECT * FROM tb_pizza WHERE preco BETWEEN 29 AND 60;

SELECT * FROM tb_pizza WHERE nome_pizza LIKE 'C%';

SELECT * FROM tb_pizza INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_pizza.fk_categoria_pizza;
SELECT * FROM tb_pizza INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_pizza.fk_categoria_pizza WHERE tipo = 'Doce';