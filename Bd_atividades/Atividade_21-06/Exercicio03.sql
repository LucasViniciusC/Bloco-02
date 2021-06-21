CREATE DATABASE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_produto ENUM('Cosmético', 'Medicação', 'Bem Estar'),
    prescricao_medica BOOLEAN NOT NULL
);

INSERT INTO tb_categoria(tipo_produto,prescricao_medica)VALUES('Cosmético', 0);
INSERT INTO tb_categoria(tipo_produto,prescricao_medica)VALUES('Cosmético', 1);
INSERT INTO tb_categoria(tipo_produto,prescricao_medica)VALUES('Medicação', 1);
INSERT INTO tb_categoria(tipo_produto,prescricao_medica)VALUES('Medicação', 0);
INSERT INTO tb_categoria(tipo_produto,prescricao_medica)VALUES('Bem Estar', 0);


CREATE TABLE tb_produto(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
    qtd_estoque INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    fk_categoria_produto INT NOT NULL,
    FOREIGN KEY(fk_categoria_produto) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Cicatricure Gel', 85.00, 25, 'Redutor de linhas de expressão',1);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Dramin', 7.00, 180, 'Medicação para enjoo, tontura e vômitos em geral',4);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Desodorante Rexona', 15.00, 60, 'Antitranspirante aerosol',5);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Acetato de Dexamatesona', 20.00, 20, 'Pomada para feridas e infecções na pele',2);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Vitâminas de A a Z', 85.00, 35, 'Vitaminas de A a Z, uso diário',4);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Gardenal', 135.00, 50, 'Este medicamento é destinado à prevenção do aparecimento de convulsões em indivíduos com epilepsia',3);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Vaporizador', 200.00, 12, 'Vaporizador para ambientes internos',5);
INSERT INTO tb_produto(nome_produto,preco,qtd_estoque,descricao,fk_categoria_produto)VALUES('Bicabornato', 5.00, 60, 'Bicabornato de sódio', 4);

SELECT * FROM tb_produto WHERE preco > 50;
SELECT * FROM tb_produto WHERE preco BETWEEN 3 AND 60;
SELECT * FROM tb_produto WHERE nome_produto LIKE 'B%';
SELECT * FROM tb_produto INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produto.fk_categoria_produto;
SELECT * FROM tb_produto INNER JOIN tb_categoria on tb_categoria.id_categoria = tb_produto.fk_categoria_produto WHERE tipo_produto = 'Cosmético'
