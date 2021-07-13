CREATE DATABASE db_curso_web;   -- Criar banco de dados
DROP DATABASE db_curso_web;     -- Deletar o banco de dados

USE db_curso_web;               -- Para setar o banco que queremos usar, toda vez que iniciarmos uma conexão observar se a tabela esta selecionada, caso não esteja, usar esse comando

--------------------------------------------- Criação de tabelas ---------------------------------------------

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


--------------------------------------------- Alteração de tabelas ---------------------------------------------

RENAME TABLE tb_cursos TO tb_registro_cursos;

--RENAME usado para alterar o nome da tabela

ALTER TABLE tb_cursos ADD COLUMN carga_horaria INT(5) NULL;

-- ALTER TABLE nome_tabela ADD novo_nome_coluna e seu tipo

ALTER TABLE tb_registro_cursos CHANGE carga_horaria carga_horaria INT NOT NULL;

ALTER TABLE tb_registro_cursos CHANGE nome_curos nome_cursos CHAR(50) NOT NULL;

-- ALTER TABLE nome_tabela CHANGE nome_coluna nome_coluna atributos ----- é usado para alterar o tipo da coluna

ALTER TABLE tb_registro_cursos DROP carga_horaria;

-- ALTER TABLE nome_tabela DROP nome_coluna_que_será_excluída

DESCRIBE tb_cursos;

--DESCRIBE nome_tabela  -*- Mostra os campos da tabela detalhadamente

--------------------------------------------- Inserindo Valores na Tabela ---------------------------------------------

INSERT INTO tb_cursos (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) VALUES 
    (1, 'curso_node.png', 'Curso Completo NODEJS e MongoDB', 'Crie aplicações back-end incríveis com a plataforma NODEJS e o banco de dados MongoDB', UTC_TIME, 1, 550.75);

INSERT INTO tb_cursos (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) VALUES 
    (2, 'curso_web.png', 'Curso Completo FRONT e BACK', 'Crie aplicações front-end e back-end incríveis do zero ao avançado', UTC_TIME, 1, 275.75);

INSERT INTO tb_cursos (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento) VALUES 
    (3, 'curso_mysql.png', 'Curso Completo de MySQL', 'Crie aplicações front-end e back-end incríveis com conexão com  Banco de Dados', UTC_TIME, 0, 299.99);

--INSERT INTO nome_tabela (campos da tabela separados por vírgula) VALUES (valores à serem adicionados, separados por vígulas e VARCHAR E CHAR entre 'aspas simples'); -*- usado para inserir valores na tabela

--------------------------------------------- Consultas em Tabelas ---------------------------------------------

SELECT * FROM tb_cursos;

--SELECT * FROM nome_tabela -*- mostra todos os valores inseridos na tabela

SELECT id_curso, nome_curso, investimento FROM tb_cursos;

--SELECT aqui podemos colocar apenas as colunas que queremos mostrar FROM nome_tabela -*- como foi feito acima

SELECT id_curso, nome_curso, investimento FROM tb_cursos WHERE investimento < 300;

--SELECT aqui podemos colocar apenas as colunas que queremos mostrar FROM nome_tabela WHERE investimento < 300 -*- como foi feito acima, porém agora mostrará apenas as inserções onde o investimento é menor que 300. A cláusula WHERE nos ajuda a filtrar os valores que queremos retornar na consulta do SELECT

-- = valor da esquerda IGUAL ao valor da direita
-- < valor da esquerda MENOR que o valor da direita
-- <= valor da esquerda MENOR OU IGUAL que o valor da direita
-- > valor da esquerda MAIOR que o valor da direita
-- >= valor da esquerda MAIOR OU IGUAL que o valor da direita

SELECT id_curso, nome_curso, investimento FROM tb_cursos WHERE investimento < 300 AND ativo = 'FALSE';

--No exemplo acima filtrei os que o inverstimento é menor que 300 e o valor ativo for false, pois, o campo ativo é booleano

-- AND todas as operações de comparação devem ser verdadeiras
-- OR pelo menos uma das operações de comparação deve ser verdadeira

--------------------------------------------- Criando outra tabela ---------------------------------------------

-- agora estou criando uma tabela tb_alunos com 100 registro, e para isso fiz inserts aleatórios pelo phpmyadmin como o generatedata.com, pesquisar como isso é feito

CREATE TABLE tb_alunos (
  id_aluno int,
  nome varchar(255) default NULL,
  idade int default NULL,
  interesse varchar(255) default NULL,
  email varchar(255) default NULL,
  estado varchar(255) default NULL,
  PRIMARY KEY (id_aluno)
);

DROP TABLE tb_alunos;

INSERT INTO tb_alunos (id_aluno,nome,idade,interesse,email,estado) VALUES 
    (1,"Jorden",47,"Esporte","vel.mauris.Integer@nec.net","DF"),
    (2,"Lacey",59,"Jogos","ligula.eu.enim@egetlaoreetposuere.com","SC"),
    (3,"Lillith",48,"Saúde","Curabitur@atvelitCras.org","MA"),
    (4,"Zephania",63,"Saúde","erat.vitae@loremtristiquealiquet.net","RS"),
    (5,"Scarlett",95,"Informática","facilisis.Suspendisse.commodo@placeratCrasdictum.org","MS"),
    (6,"Nash",39,"Música","Aliquam@Maurisquisturpis.org","BA"),
    (7,"Indigo",62,"Informática","mus.Proin@laoreet.co.uk","GO"),
    (8,"Bernard",77,"Esporte","ut@Craspellentesque.net","PA"),
    (9,"Cheyenne",78,"Música","vel.pede@liberoduinec.co.uk","PR"),
    (10,"Nerea",88,"Música","non@facilisisvitae.edu","PB"),
    (11,"Lucius",57,"Esporte","eu.erat@interdum.ca","PE"),
    (12,"Fallon",38,"Saúde","risus@Etiamimperdietdictum.net","MT"),
    (13,"Steven",35,"Música","tellus@netus.org","CE"),
    (14,"Paul",37,"Música","sollicitudin.adipiscing@magnaCras.edu","GO"),
    (15,"Bradley",31,"Música","massa.Vestibulum@vitaesemperegestas.com","AP"),
    (16,"Jeanette",46,"Informática","vitae@accumsannequeet.co.uk","MG"),
    (17,"Craig",40,"Informática","magna.et.ipsum@tellusid.edu","MS"),
    (18,"Maia",94,"Esporte","ac@tempusnon.co.uk","PB"),
    (19,"Harriet",16,"Jogos","ante.ipsum@maurissitamet.com","AL"),
    (20,"Finn",99,"Informática","metus.vitae@vitaerisusDuis.com","MT"),
    (21,"Rafael",71,"Esporte","adipiscing.elit.Etiam@vel.edu","MG"),
    (22,"Cynthia",85,"Esporte","Donec.nibh.Quisque@Sed.org","RN"),
    (23,"Evelyn",13,"Informática","lacus.Aliquam.rutrum@etrutrumeu.edu","MA"),
    (24,"Sybil",39,"Saúde","semper@nuncsed.com","ES"),
    (25,"Uriel",10,"Esporte","semper.pretium.neque@eumetusIn.ca","PB");

INSERT INTO tb_alunos (id_aluno,nome,idade,interesse,email,estado) VALUES 
    (26,"Dakota",99,"Esporte","ipsum@etrutrumnon.co.uk","PB"),
    (27,"Stewart",31,"Saúde","natoque.penatibus.et@inhendrerit.org","CE"),
    (28,"Cruz",96,"Saúde","Cum.sociis.natoque@elementumloremut.org","RS"),
    (29,"Kadeem",57,"Informática","consectetuer@faucibusleoin.net","MS"),
    (30,"Wyatt",36,"Música","feugiat.non@dolorsitamet.net","SC"),
    (31,"Griffith",28,"Jogos","Lorem@elementumsem.com","RO"),
    (32,"Yvette",39,"Saúde","mauris@dignissim.com","RO"),
    (33,"Burton",14,"Esporte","leo.elementum.sem@arcuVestibulumante.edu","SC"),
    (34,"Tatum",4,"Saúde","eget.lacus@nequeInornare.com","PA"),
    (35,"Graham",88,"Informática","ac@necurna.com","ES"),
    (36,"Aretha",37,"Esporte","malesuada.augue@Nunc.com","ES"),
    (37,"Sloane",5,"Saúde","parturient@purusMaecenaslibero.net","CE"),
    (38,"Uriel",81,"Saúde","Praesent.interdum@enimnon.net","AL"),
    (39,"Cameran",61,"Esporte","sem.consequat@senectus.com","PR"),
    (40,"Chiquita",8,"Jogos","nisl.Quisque@utodio.co.uk","MA"),
    (41,"Tanek",40,"Esporte","nonummy@lectusNullamsuscipit.org","AL"),
    (42,"Bruno",3,"Jogos","semper.Nam@atpretium.ca","DF"),
    (43,"Winter",14,"Jogos","Quisque.nonummy@dolorNulla.ca","RS"),
    (44,"Jacob",82,"Música","nec.eleifend.non@sapien.ca","RR"),
    (45,"Kuame",98,"Esporte","placerat@ametorci.ca","PR"),
    (46,"Orli",74,"Saúde","eu.erat.semper@dolorsitamet.co.uk","ES"),
    (47,"Amber",24,"Informática","eleifend.non@quamvelsapien.org","AL"),
    (48,"Roary",77,"Saúde","quis.pede.Suspendisse@Duisa.com","SE"),
    (49,"Octavius",28,"Jogos","euismod.in.dolor@posuere.edu","PA"),
    (50,"Isabella",54,"Informática","eu@euarcuMorbi.ca","RR");

INSERT INTO tb_alunos (id_aluno,nome,idade,interesse,email,estado) VALUES 
    (51,"Driscoll",70,"Informática","sem@malesuada.com","SP"),
    (52,"Brendan",45,"Informática","arcu.et.pede@magna.com","SC"),
    (53,"Quon",18,"Informática","elit@adipiscingnon.org","AP"),
    (54,"Rajah",48,"Informática","magna.tellus@Quisquefringilla.org","RJ"),
    (55,"Lewis",32,"Informática","faucibus@vulputate.com","PA"),
    (56,"Ronan",34,"Esporte","tellus.non@eleifend.com","CE"),
    (57,"Baxter",72,"Esporte","enim.sit@urnanec.ca","DF"),
    (58,"Kyla",6,"Esporte","facilisis.eget@sociosquadlitora.net","AM"),
    (59,"Ava",54,"Jogos","velit@acmattis.edu","RN"),
    (60,"Leonard",59,"Música","fermentum.arcu@consequatenim.ca","MS"),
    (61,"Byron",17,"Música","Pellentesque.habitant.morbi@sapienNunc.edu","MT"),
    (62,"Roary",52,"Jogos","nec.eleifend.non@velvenenatis.org","GO"),
    (63,"Amery",89,"Informática","mauris.aliquam.eu@Proindolor.net","PA"),
    (64,"Adele",40,"Saúde","scelerisque@velvenenatisvel.com","RR"),
    (65,"Ronan",14,"Saúde","posuere.cubilia@Donecnonjusto.co.uk","RJ"),
    (66,"Marny",53,"Saúde","convallis.in.cursus@blanditatnisi.com","PA"),
    (67,"Camden",31,"Música","magna@mauriseu.edu","RJ"),
    (68,"Yoko",13,"Música","dolor@vehiculaet.com","AM"),
    (69,"Ina",71,"Informática","gravida.sagittis@tempusscelerisquelorem.com","AL"),
    (70,"Tyler",3,"Esporte","Proin.dolor.Nulla@nascetur.org","PI"),
    (71,"Destiny",19,"Saúde","augue.id@elementum.edu","MG"),
    (72,"Glenna",82,"Jogos","dui@interdumligula.ca","AP"),
    (73,"Buffy",55,"Esporte","dictum.eu@placeratvelitQuisque.net","MA"),
    (74,"Hashim",27,"Música","est.congue@enim.org","MA"),
    (75,"Hiram",67,"Saúde","nunc.sit.amet@nibhPhasellus.co.uk","RN");

INSERT INTO tb_alunos (id_aluno,nome,idade,interesse,email,estado) VALUES 
    (76,"Kenneth",50,"Esporte","a.nunc.In@Integermollis.edu","AL"),
    (77,"Ariel",9,"Jogos","Etiam.vestibulum.massa@egestas.edu","PA"),
    (78,"Barrett",24,"Informática","fringilla.mi@liberoIntegerin.com","PA"),
    (79,"Kato",25,"Música","cursus.in.hendrerit@eu.org","BA"),
    (80,"Lance",50,"Saúde","Nullam@necurna.net","CE"),
    (81,"Porter",50,"Jogos","ultrices.mauris@nequesed.org","PA"),
    (82,"Zeus",26,"Informática","hymenaeos@Integereu.net","RR"),
    (83,"Oleg",36,"Informática","Nam@morbitristiquesenectus.ca","AL"),
    (84,"Erin",25,"Saúde","ligula@Nullam.edu","TO"),
    (85,"Wade",61,"Esporte","odio.Aliquam.vulputate@egestas.edu","MS"),
    (86,"Ross",92,"Música","tortor.at.risus@ac.edu","DF"),
    (87,"Martina",24,"Música","Cras@lacusAliquam.com","MS"),
    (88,"Rowan",75,"Saúde","erat@afelisullamcorper.com","RO"),
    (89,"Aristotle",22,"Esporte","at.auctor@Utnecurna.net","PI"),
    (90,"Bernard",24,"Saúde","placerat.orci.lacus@vitaesemperegestas.edu","RJ"),
    (91,"Teegan",9,"Música","id@Fuscealiquam.co.uk","DF"),
    (92,"Graiden",7,"Jogos","ante.dictum@nibhAliquam.co.uk","AL"),
    (93,"Alec",50,"Música","vestibulum.neque.sed@nislQuisque.co.uk","PE"),
    (94,"Savannah",61,"Jogos","odio.a.purus@nequeSedeget.co.uk","ES"),
    (95,"Rafael",45,"Informática","a@dolorsit.net","PB"),
    (96,"Clementine",32,"Saúde","dictum@Aliquamerat.edu","RS"),
    (97,"Tasha",53,"Esporte","in@justoProin.co.uk","AC"),
    (98,"Hector",83,"Música","Class.aptent@et.co.uk","AM"),
    (99,"Tara",95,"Jogos","Donec.porttitor.tellus@nonfeugiat.co.uk","DF"),
    (100,"Charissa",50,"Informática","orci@elementumduiquis.ca","AP");

----------------------------------- Realizando consultas na nova tabela usando operadores -----------------------------------

USE db_curso_web;

SELECT * FROM tb_alunos WHERE interesse = 'Jogos';

SELECT * FROM tb_alunos WHERE idade >= 35;

SELECT * FROM tb_alunos WHERE idade >= 45 AND interesse = 'Jogos';

SELECT * FROM tb_alunos WHERE idade >= 45 AND interesse = 'Jogos' AND estado = 'RN';

SELECT * FROM tb_alunos WHERE idade > 45 OR interesse = 'Jogos';

----------------------------------- Realizando consultas avançadas na nova tabela usando operadores -----------------------------------

USE db_curso_web;

------------------------------------------ BETWEEN ------------------------------------------

-- BETWEEN -> entre  --> pode ser usado também em intervalos de datas

SELECT * FROM tb_alunos WHERE idade >= 18 AND idade <= 21;

SELECT * FROM tb_alunos WHERE idade BETWEEN 18 AND 21;

SELECT * FROM tb_alunos WHERE id_aluno BETWEEN 35 AND 40;

---------------------------------------- IN e NOT IN -----------------------------------------

-- IN --> facilita as consultas com uma lista de possibilidades
-- NOT IN --> Retorna o contrário da consulta IN

SELECT * FROM tb_alunos WHERE interesse = 'Jogos' OR interesse = 'Música' OR interesse = 'Esporte';

SELECT * FROM tb_alunos WHERE interesse IN ('Jogos','Música','Esporte');

SELECT * FROM tb_alunos WHERE interesse NOT IN ('Jogos','Música','Esporte');

-------------------------------------------- LIKE --------------------------------------------

-- LIKE --> Permite realizar filtros com base em uma pesquisa de caracteres dentro de uma coluna textual

-- % Indica que pode haver a existência de qualquer conjunto de caracter no texto

SELECT * FROM tb_alunos WHERE nome LIKE 'E%'; -- nomes que se iniciam com a letra E

SELECT * FROM tb_alunos WHERE nome LIKE '%ne'; -- nomes que se finalizam com a letra NE

SELECT * FROM tb_alunos WHERE nome LIKE '%a%'; -- nomes que tem o caractere A no meio do nome

-- _ Indica que pode haver a existência de um ou mais caracteres em uma posição específica do texto

SELECT * FROM tb_alunos WHERE nome LIKE '_riel'; -- uma palavra em que seja qualquer letra na primeira posição e termine com RIEL

SELECT * FROM tb_alunos WHERE nome LIKE '_ru_'; -- uma palavra em que seja qualquer letra na primeira e na ultima posição e entre elas RU

SELECT * FROM tb_alunos WHERE nome LIKE 'I__'; -- retorna com nome iniciado com a letra I e tem apenas 3 letras esse mesmo nome

SELECT * FROM tb_alunos WHERE nome LIKE '%tt_'; -- combinando os coringas

----------------------------------------- ORDER BY ------------------------------------------

-- ORDER BY ---> usado para ordenar os resultados

-- ASC --> ascendente, ou seja, do menor para o maior
SELECT nome, idade FROM tb_alunos WHERE idade BETWEEN 18 AND 25 ORDER BY nome ASC;

-- DESC --> descrescente, ou seja, do maior para o menor
SELECT nome, idade FROM tb_alunos WHERE idade BETWEEN 18 AND 25 ORDER BY nome DESC;

SELECT nome, idade FROM tb_alunos WHERE idade BETWEEN 18 AND 25 ORDER BY nome ASC, idade DESC;
-- a idade descrescente respeitará o nome

--------------------------------------- LIMIT e OFFSET ---------------------------------------

-- LIMIT e OFFSET Limitando o retorno das consultas

SELECT * FROM tb_alunos LIMIT 25; -- retornar apenas os 25 primeiros registros
SELECT * FROM tb_alunos ORDER BY id_aluno DESC LIMIT 25; -- retornar apenas os 25 ultimos registros
SELECT * FROM tb_alunos LIMIT 4 OFFSET 0; -- a partir do registro 0 do BD traga 4 registros
SELECT * FROM tb_alunos LIMIT 4 OFFSET 4; -- a partir do registro 4 do BD traga 4 registros
SELECT * FROM tb_alunos LIMIT 4 OFFSET 8; -- a partir do registro 8 do BD traga 4 registros
SELECT * FROM tb_alunos LIMIT 8,4; -- a partir do registro 8 do BD traga 4 registros

------------------------------------ Funçoes de Agregação -------------------------------------

SELECT * FROM tb_cursos;

TRUNCATE tb_cursos;

USE db_curso_web;

INSERT INTO tb_cursos (id_curso, imagem_curso, nome_curso, resumo, data_cadastro, ativo, investimento, carga_horaria) VALUES 
    (1, 'curso_node.jpg', 'Curso Completo do Desenvolvedor NodeJS e MongoDB', 'Resumo do curso de NodeJS', '2018-01-01', 1, 159.99, 15), 
    (2, 'curso_react_native.jpg', 'Multiplataforma Android/IOS com React e Redux', 'Resumo do curso de React Native', '2018-02-01', 1, 204.99, 37), 
    (3, 'angular.jpg', 'Desenvolvimento WEB com ES6, TypeScript e Angular', 'Resumo do curso de ES6, TypeScript e Angular', '2018-03-01', 1, 579.99, 31), 
    (4, 'web_completo_2.jpg', 'Web Completo 2.0', 'Resumo do curso de Web Completo 2.0', '2018-04-01', 1, 579.99, 59), 
    (5, 'linux.jpg', 'Introdução ao GNU/Linux', 'Resumo do curso de GNU/Linux', '2018-05-01', 0, 0, 1);

-- MIN(<coluna>) - Retorna o menor valor de todos os registros com base em uma coluna

SELECT MIN(investimento) FROM tb_cursos WHERE ativo = true; 

-- MAX(<coluna>) - Retorna o maior valor de todos os registros com base em uma coluna

SELECT MAX(investimento) FROM tb_cursos WHERE ativo = true;

-- AVG(<coluna>) - Retorna a média de todos os registros com base em uma coluna

SELECT AVG(investimento) FROM tb_cursos where ativo = true;

-- SUM(<coluna>) - Retorna a soma dos valores de todos os registros com base em uma coluna

SELECT SUM(investimento) FROM tb_cursos where ativo = true;

-- COUNT(*) - Retorna a quantidade de todos os registros de uma tabela

SELECT COUNT(*) FROM tb_cursos where ativo = true;  -- contar todos que estão ativos

------------------------------------- GROUP BY -------------------------------------

-- GROUP BY -> agrupa os registros com base em uma ou mais colunas cujos valores sejam iguais. Permite realizar funções de agregação em cada subconjunto agrupado de registros

SELECT interesse, COUNT(*) AS total_por_interesse FROM tb_alunos GROUP BY interesse;

SELECT estado, COUNT(*) AS total_por_estado FROM tb_alunos GROUP BY estado;

------------------------- Filtrando seleções agrupadas ------------------------------

-- HAVING -> filtro realizado sobre o resultado dos agrupamentos (GROUP BY)

SELECT estado, COUNT(*) AS total_por_estado FROM tb_alunos GROUP BY estado HAVING total_por_estado >= 5;

SELECT estado, COUNT(*) AS total_por_estado FROM tb_alunos GROUP BY estado HAVING estado IN('MG', 'SP');

SELECT estado, COUNT(*) AS total_por_estado FROM tb_alunos GROUP BY estado HAVING estado IN('CE', 'SC') AND total_por_estado > 4;

SELECT estado, COUNT(*) AS total_por_estado FROM tb_alunos WHERE interesse != 'Esporte' GROUP BY estado HAVING total_por_estado > 3;

----------------------------- Atualizando Registros ----------------------------------

