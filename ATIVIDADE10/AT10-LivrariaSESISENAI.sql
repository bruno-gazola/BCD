-- Criando o banco de dados
CREATE DATABASE db_livraria;

-- Usando o banco de dados
USE db_livraria;

-- Criando a tabela cliente
CREATE TABLE IF NOT EXISTS tb_cliente(
id_cliente int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar(45) NOT NULL,
cpf varchar(11) NOT NULL,
rg varchar(11) NOT NULL,
email varchar(45) NOT NULL
);

-- Criando a tabela dos telefones dos clientes
CREATE TABLE IF NOT EXISTS tb_clientes_telefones (
id_telefone int PRIMARY KEY NOT NULL AUTO_INCREMENT,
telefone varchar(15),
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente)
);

-- Criando a tabela dos edereços dos clientes
CREATE TABLE IF NOT EXISTS tb_clientes_endereco(
id_endereco int PRIMARY KEY NOT NULL AUTO_INCREMENT,
rua varchar(45) NOT NULL,
numero int NOT NULL,
cidade varchar(45) NOT NULL,
estado varchar(45) NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente)
);

-- Criando a tabela de pedidos
CREATE TABLE IF NOT EXISTS tb_pedido(
id_pedido int PRIMARY KEY NOT NULL AUTO_INCREMENT,
valor decimal(10,2) NOT NULL,
dia_hora date NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente)
);

-- Criando a tabela editora
CREATE TABLE IF NOT EXISTS tb_editora(
id_editora int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome_editora varchar(45) NOT NULL,
nome_contato varchar(45) NOT NULL,
email varchar(45) NOT NULL,
contato varchar(45) NOT NULL
);

-- Criando a tabela dos livros
CREATE TABLE IF NOT EXISTS tb_livro (
id_livro int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 titulo varchar(45) NOT NULL,
 categoria varchar(45) NOT NULL,
 isbn varchar(13) NOT NULL,
 ano date NOT NULL,
 valor decimal(10,2) NOT NULL,
 autor varchar(45) NOT NULL,
 EDITORA_id_editora int,
 FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_editora(id_editora)
);


-- Criando a tabela dos itens pedidos
CREATE TABLE IF NOT EXISTS tb_item_pedido(
quantidade int NOT NULL,
valor decimal(10,2) NOT NULL,
PEDIDO_id_pedido int,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_pedido(id_pedido),
LIVRO_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro)
);

-- Criando a tabela estoque 
CREATE TABLE IF NOT EXISTS tb_estoque(
quantidade int NOT NULL,
LIVRO_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro(id_livro)
);

