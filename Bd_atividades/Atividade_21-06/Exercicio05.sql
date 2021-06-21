CREATE DATABASE db_construindo_a_nossa_vida;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Construção','Elétrica','Encanamento','Segurança','Casa e Reforma'),
    experiencia_para_uso BOOLEAN  NOT NULL
);

INSERT INTO tb_categoria(tipo,experiencia_para_uso)VALUES('Construção', 0);
INSERT INTO tb_categoria(tipo,experiencia_para_uso)VALUES('Elétrica', 1);
INSERT INTO tb_categoria(tipo,experiencia_para_uso)VALUES('Encanamento', 0);
INSERT INTO tb_categoria(tipo,experiencia_para_uso)VALUES('Casa e Reforma', 0);
INSERT INTO tb_categoria(tipo,experiencia_para_uso)VALUES('Construção', 1);

CREATE TABLE tb_produtos(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    qtd_produto INT NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    fk_categoria_produto INT NOT NULL,
    FOREIGN KEY(fk_categoria_produto) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Tijolo', 1800 , 180.00, 'Tijolo Bahiano 8 Furos 09 X 19 X 19cm.', 5);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Tinta Branca', 55 , 99.00, 'Lata de tinta 5 Lt, Coral', 4);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Pincel Sedas Macias', 25 , 2.50, 'Pincel Seda Macia para acabamentos', 4);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Duflex 6mm', 100 , 100.00, 'Fio de energia 6mm Azul, Anti-chama', 2);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Parafusadeira', 7 , 299.00, 'Parafusadeira 5 Brocas', 4);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Cano PVC 25cm', 22 , 55.00, 'Encanamento de PVC de 25cm de largura', 3);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Piso', 1000 , 130.00, 'Piso 15X6 Diversas cores', 4);
INSERT INTO tb_produtos(nome_produto,qtd_produto,preco,descricao,fk_categoria_produto)VALUES('Cimento', 50 , 39.00, 'Cimento uso geral 50KG', 1);

SELECT * FROM tb_produtos WHERE preco > 50;
SELECT * FROM tb_produtos WHERE preco BETWEEN 3 AND 60;
SELECT * FROM tb_produtos WHERE nome_produto LIKE 'c%';

SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria_produto;
SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id-categoria = tb_produtos.fk_categoria_produto WHERE tipo = 'Elétrica';