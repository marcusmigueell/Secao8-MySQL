CREATE DATABASE db_curso_web;   -- Criar banco de dados
DROP DATABASE db_curso_web;     -- Deletar o banco de dados

USE db_curso_web;               -- Para setar o banco que queremos usar

----------------------------- Criação de tabelas -----------------------------

-- Campos de texto:
-- text (tamanho variável que armazena uma grande quantidade de caracteres)
-- Varchar (tamanho variável que armazena de 0 até 255 caracteres)
-- Char (tamanho fixo que armazena de 0 até 255 caracteres)

-- Campos numéricos:
-- Int (valores numéricos inteiros)
-- Float (valores numéricos fracionarios)

-- Campos de data e hora:
-- Date (data no formato YYYY/mm/dd)
-- Time (hora)
-- Datetime (combinação de date e time em um mesmo campo)

CREATE TABLE tb_cursos (
    id_curso INT NOT NULL,
    imagem_curso VARCHAR(100) NOT NULL,
    nome_curso CHAR(50) NOT NULL,
    resumo TEXT NULL,
    data_cadastro DATETIME NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    investimento FLOAT(8,2) DEFAULT 0,
    PRIMARY KEY (id_curso)
)DEFAULT CHARSET=utf8;

DROP TABLE tb_cursos;

----- Explicação de alguns comandos usados acima -----

-- AUTO_INCREMENT a cada inserção de dados na tabela o valor do id será incrementado automaticamente
-- NOT NULL ao inserir dados na tabela, esses campos não poderão ser vazios
-- DEFAULT TRUE é para que a cada inserção o valor seja TRUE, a não ser que no momento da inserção, trocamos para FALSE
--    ao analisarmos o campo BOOLEAN 1 = TRUE e 0 = FALSE
-- FLOAT(8,2) 8 casa antes da vírgula e 2 casas após a vírgula
-- PRIMARY KEY é a chave primária da tabela

------------------------------------------------------------------------------

---------------------------- Alteração de tabelas ----------------------------

RENAME TABLE tb_cursos TO tb_registro_cursos;

ALTER TABLE tb_registro_cursos ADD COLUMN carga_horaria VARCHAR(5) NOT NULL;

ALTER TABLE tb_registro_cursos CHANGE carga_horaria carga_horaria INT NOT NULL;

ALTER TABLE tb_registro_cursos CHANGE nome_curos nome_cursos CHAR(50) NOT NULL;

ALTER TABLE tb_registro_cursos DROP carga_horaria;

DESCRIBE tb_registro_cursos;

INSERT INTO tb_cursos (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) VALUES 
    (1, 'curso_node.png', 'Curso Completo NODEJS e MongoDB', 'Crie aplicações back-end incríveis com a plataforma NODEJS e o banco de dados MongoDB', UTC_TIME, 1, 550.75);

select * from tb_cursos;