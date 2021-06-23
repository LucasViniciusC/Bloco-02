CREATE DATABASE db_generation_game_online;

CREATE TABLE tb_classe(
	id_classe INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	poderes ENUM('Fogo','Ar','Mágia','Força','Água','Terra'),
	aldeia_natal VARCHAR(255) NOT NULL
);
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Fogo', 'Vila das Chamas');
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Ar', 'Aldeia dos Ventos');
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Mágia', 'Vila dos Magos');
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Força', 'Vila Strong Force');
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Água', 'Vila da Gota Molhada');
INSERT INTO tb_classe(poderes, aldeia_natal)VALUES('Terra', 'Vila Terralia');

SELECT * FROM tb_classe;

CREATE TABLE tb_personagem(
	id_personagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_personagem VARCHAR(255) NOT NULL,
    nivel_personagem INT NOT NULL,
	poder_ataque DECIMAL(8,2) NOT NULL,
	poder_defesa DECIMAL(8,2) NOT NULL,
    fk_id_personagem INT NOT NULL,
    FOREIGN KEY(fk_id_personagem) REFERENCES tb_classe(id_classe)
);

INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Ganter',57, 2550 ,8000, 2);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Flyn',180, 5800 ,3000, 1);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Agata',220, 5000 ,6000, 3);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Priston',80, 8000 ,2000, 4);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Elesis',320, 9500 ,8000, 4);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Lin',27, 1800 ,1000, 6);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Lass',57, 2550 ,2000, 5);
INSERT INTO tb_personagem (nome_personagem ,nivel_personagem ,poder_ataque ,poder_defesa ,fk_id_personagem)VALUES('Cancuro',200, 5000 ,8000, 3);

SELECT * FROM tb_personagem WHERE poder_ataque > 2000;
SELECT * FROM tb_personagem WHERE poder_defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagem WHERE nome_personagem LIKE 'c%';

SELECT * FROM tb_personagem INNER JOIN tb_classe ON tb_classe.id_classe = tb_personagem.fk_id_personagem;
SELECT * FROM tb_personagem INNER JOIN tb_classe ON tb_classe.id_classe = tb_personagem.fk_id_personagem WHERE poderes = 'mágia';

