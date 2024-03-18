-- PROJETO sql bd pizzaria - 2DM, Erica Lelis
-- Adendos: 
    -- PROF, não estou conseguindo entender como exportar algo como chave estrangeira sem ser UNIQUE ou PK 
    -- e isso dá conflito com o tanto de colunas que eu gostaria de associar entre as tabelas, estas tentativas estão commitadas pelo código.
    
CREATE DATABASE pizzaria;

USE pizzaria;

CREATE TABLE cliente(
	pk_IDcliente	INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(60)  NOT NULL,
    telefone		CHAR(11)	 NOT NULL,
    endereco		VARCHAR(120) NOT NULL
    
);

CREATE TABLE estoque_sabor(
	pk_IDsabor		INT PRIMARY KEY AUTO_INCREMENT,
	nomeSabor		VARCHAR(30) NOT NULL,
    descricaoSabor	VARCHAR(120)NOT NULL,
    numEstoqueSabor	INT 		NOT NULL

);

CREATE TABLE estoque_borda(
	pk_IDborda		INT PRIMARY KEY AUTO_INCREMENT,
    nomeBorda		VARCHAR(30)	NOT NULL  DEFAULT"borda sem recheio",
    descricaoBorda	VARCHAR(60) NOT NULL,
    numEstoqueBorda	INT 		NOT NULL

);

CREATE TABLE fornada(
	pk_IDfornada	INT PRIMARY KEY AUTO_INCREMENT,
    numFornada		INT			NOT NULL,
    dataHora		DATETIME	NOT NULL,
    -- fk_nomePizza	VARCHAR(30)	NOT NULL,
    pizzaiolo		VARCHAR(30) NOT NULL
    
    -- FOREIGN KEY(fk_nomePizza) REFERENCES pizza(nomePizza)

);

CREATE TABLE pizza(
	pk_IDpizza		INT PRIMARY KEY AUTO_INCREMENT,
    nomePizza		VARCHAR(30) NOT NULL,
    fk_IDsabor		INT 		NOT NULL,
    fk_IDborda		INT			NOT NULL,
    fk_IDfornada	INT			NOT NULL,
    
    valorUnitPizza	INT 		NOT NULL,
    
    FOREIGN KEY(fk_IDsabor) REFERENCES  estoque_sabor(pk_IDsabor),
    FOREIGN KEY(fk_IDborda) REFERENCES  estoque_borda(pk_IDborda),
	FOREIGN KEY(fk_IDfornada)REFERENCES fornada(pk_IDfornada)
    
);

CREATE TABLE drink(
	pk_IDdrink		INT PRIMARY KEY AUTO_INCREMENT,
    nomeDrink		VARCHAR(30) NOT NULL,
    tipoDrink		VARCHAR(90) NOT NULL,
    numEstoque		INT			NOT NULL,
    
    valorUnitDrink		INT 		NOT NULL
 
);

CREATE TABLE pedidos(
	pk_IDordem		INT PRIMARY KEY AUTO_INCREMENT,
    numPedido		INT			NOT NULL,
    dataHora		DATETIME	NOT NULL,
    
	fk_IDpizza		INT 		NOT NULL,
    -- fk_nomePizza	VARCHAR(30) NOT NULL,
    -- fk_valorPizza	INT			NOT NULL,
    
    fk_IDdrink		INT,
    -- fk_nomeDrink	VARCHAR(30),
    -- fk_valorDrink	INT,
    
    valorTotal		INT 		NOT NULL,
    
    FOREIGN KEY(fk_IDpizza)    REFERENCES pizza(pk_IDpizza),
    -- FOREIGN KEY(fk_nomePizza)  REFERENCES pizza(nome_Pizza),
    -- FOREIGN KEY(fk_valorPizza) REFERENCES pizza(valorUnitPizza),
    
    FOREIGN KEY(fk_IDdrink)    REFERENCES drink(pk_IDdrink)
    -- FOREIGN KEY(fk_nomeDrink)  REFERENCES drink(nomeDrink),
    -- FOREIGN KEY(fk_valorDrink) REFERENCES drink(valorUnitDrink)
    
);