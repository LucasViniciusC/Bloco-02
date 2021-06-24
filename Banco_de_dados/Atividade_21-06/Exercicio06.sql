CREATE DATABASE db_cursoDaMinhaVida;

CREATE TABLE tb_categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    professor VARCHAR(255)  NOT NULL,
    area ENUM('Front-end','Back-end','DevOps','Data Science','UI/UX Design') NOT NULL
);

INSERT INTO tb_categoria(professor, area)VALUES('Pedro Sampaio','Front-end');
INSERT INTO tb_categoria(professor, area)VALUES('Alessandra Afonso','Back-end');
INSERT INTO tb_categoria(professor, area)VALUES('Marcelo Queiroga','UI/UX Design');
INSERT INTO tb_categoria(professor, area)VALUES('Aline Rodriguez','DevOps');
INSERT INTO tb_categoria(professor, area)VALUES('Maria França','Data Science');

CREATE TABLE tb_cursos(
	id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL,
    semestres INT NOT NULL,
    qtd_alunos INT NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    fk_categoria_curso INT NOT NULL,
    FOREIGN KEY (fk_categoria_curso) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('Figma e Sketch', 2, 25 ,300.00, 3);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('Node.js E MongoDB', 1, 12, 120.00 , 2);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('HTML5 e CSS3', 1, 40, 45.00 , 1);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('BootStrap', 2, 35, 60.00 , 1);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('Docker DCA', 3, 50, 199.00 , 4);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('Python', 3, 42, 80.00 , 5);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('PHP e Mysql', 2, 37, 35.99 , 2);
INSERT INTO tb_cursos(nome_curso, semestres, qtd_alunos, preco ,fk_categoria_curso)VALUES('UX Research', 2, 60, 89.90 , 3);

SELECT * FROM tb_cursos WHERE preco > 50;
SELECT * FROM tb_cursos WHERE preco BETWEEN 30 AND 60;
SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT * FROM tb_cursos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_cursos.fk_categoria_curso;
SELECT * FROM tb_cursos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_cursos.fk_categoria_curso WHERE area = 'Front-end';