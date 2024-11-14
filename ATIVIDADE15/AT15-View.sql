DROP DATABASE IF EXISTS db_mercadosenai;

CREATE DATABASE IF NOT EXISTS db_mercadosenai;

USE db_mercadosenai;

CREATE TABLE IF NOT EXISTS tb_cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL,
    telefone_cliente VARCHAR(20),
    cpf VARCHAR(11),
    data_nascimento DATE,
    rua VARCHAR(20),
	numero_casa INT,
	bairro VARCHAR(20),
	cidade VARCHAR(20),
    estado CHAR(2) -- CHAR: tamanho fixo, usa o mesmo espaço independentemente do conteúdo; ideal para textos curtos e constantes (ex: 50 caracteres)                
);

INSERT INTO tb_cliente (nome_cliente, email_cliente, telefone_cliente, cpf, data_nascimento, rua, numero_casa, bairro, cidade, estado) VALUES
('João da Silva', 'joao.silva@gmail.com', '11987654321', '12345678901', '1985-02-14', 'Rua das Flores', 120, 'Centro', 'São Paulo', 'SP'),
('Maria Oliveira', 'maria.oliveira@hotmail.com', '21987654322', '23456789012', '1990-06-23', 'Av. Brasil', 205, 'Copacabana', 'Rio de Janeiro', 'RJ'),
('Carlos Pereira', 'carlos.pereira@hotmail.com', '31987654323', '34567890123', '1978-11-30', 'Rua das Acácias', 45, 'Savassi', 'Belo Horizonte', 'MG'),
('Ana Costa', 'ana.costa@gmail.com', '41987654324', '45678901234', '1995-05-10', 'Rua Palmeiras', 32, 'Centro', 'Porto Alegre', 'RS'),
('Paulo Mendes', 'paulo.mendes@outlook.com', '51987654325', '56789012345', '1982-08-18', 'Av. Paulista', 101, 'Bela Vista', 'São Paulo', 'SP'),
('Luciana Silva', 'luciana.silva@gmail.com', '62987654326', '67890123456', '1975-03-15', 'Rua das Hortênsias', 78, 'Jardim América', 'Goiânia', 'GO'),
('Renato Santos', 'renato.santos@yahoo.com', '71987654327', '78901234567', '1992-12-20', 'Rua Augusta', 150, 'Centro', 'São Paulo', 'SP'),
('Fernanda Lima', 'fernanda.lima@hotmail.com', NULL, '89012345678', '1987-04-07', 'Av. Central', 310, 'Jardim Europa', 'Curitiba', 'PR'),
('Roberto Souza', 'roberto.souza@gmail.com', '91987654329', '90123456789', '1970-10-02', 'Rua das Laranjeiras', 55, 'Centro', 'Salvador', 'BA'),
('Patrícia Duarte', 'patricia.duarte@gmail.com', '11987654330', '01234567890', '1983-07-21', 'Av. das Américas', 202, 'Centro', 'Florianópolis', 'SC'),
('Marcos Almeida', 'marcos.almeida@yahoo.com', '21987654331', '09876543210', '1991-02-28', 'Rua das Mangueiras', 35, 'Setor Oeste', 'Goiânia', 'GO'),
('Juliana Carvalho', 'juliana.carvalho@hotmail.com', '31987654332', '11223344556', '1989-09-12', 'Rua dos Jacarandás', 67, 'Centro', 'São Luís', 'MA'),
('Felipe Rocha', 'felipe.rocha@gmail.com', '41987654333', '22334455667', '1997-11-05', 'Av. dos Coqueiros', 90, 'Centro', 'Manaus', 'AM'),
('Camila Ribeiro', 'camila.ribeiro@yahoo.com', '51987654334', '33445566778', '1986-03-19', 'Rua das Palmeiras', 10, 'Centro', 'Recife', 'PE'),
('Eduardo Nunes', 'eduardo.nunes@outlook.com', '61987654335', '44556677889', '1993-01-08', 'Rua dos Pinheiros', 105, 'Centro', 'Fortaleza', 'CE');


CREATE TABLE IF NOT EXISTS tb_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL, -- VARCHAR: tamanho variável, ideal para textos curtos de tamanho variável (ex: 1-100 caracteres)
    descricao TEXT, -- TEXT: ideal para textos longos (ex: descrições) que podem ter tamanho maior e variável
    preco_compra DECIMAL(10, 2) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria VARCHAR(50)
);

INSERT INTO tb_produto (nome_produto, descricao, preco_compra, preco_venda, estoque, categoria) VALUES
('Arroz Tipo 1', 'Arroz branco, grãos longos, ideal para o dia a dia', 3.50, 5.90, 120, 'Alimentos'),
('Feijão Carioca', 'Feijão carioca, rico em proteínas, embalado a vácuo', 4.00, 7.50, 90, 'Alimentos'),
('Açúcar Cristal', 'Açúcar cristal refinado, ideal para adoçar bebidas e receitas', 2.30, 4.20, 150, 'Alimentos'),
('Sal Refinado', 'Sal refinado iodado, para temperar e cozinhar', 1.00, 2.50, 200, 'Alimentos'),
('Óleo de Soja', 'Óleo de soja, embalagem de 900ml, utilizado para frituras e temperos', 4.70, 8.50, 80, 'Alimentos'),
('Macarrão Espaguete', 'Macarrão espaguete, 500g, ideal para massas simples e práticas', 2.80, 5.50, 130, 'Alimentos'),
('Molho de Tomate', 'Molho de tomate pronto, ideal para massas e pizzas', 3.20, 6.00, 110, 'Alimentos'),
('Leite Longa Vida', 'Leite integral longa vida, embalagem de 1L', 3.80, 6.00, 100, 'Laticínios'),
('Queijo Mussarela', 'Queijo mussarela fatiado, 300g, para sanduíches e pizzas', 10.00, 18.00, 70, 'Laticínios'),
('Presunto', 'Presunto cozido, fatiado, 300g', 7.20, 12.00, 50, 'Laticínios'),
('Margarina', 'Margarina cremosa, ideal para pães e bolos', 3.10, 5.80, 120, 'Alimentos'),
('Café Torrado', 'Café torrado e moído, embalagem de 250g', 5.40, 9.50, 60, 'Bebidas'),
('Refrigerante Cola', 'Refrigerante cola 2L, embalagem plástica', 4.00, 7.00, 150, 'Bebidas'),
('Suco de Laranja', 'Suco de laranja 1L, sem conservantes', 5.00, 9.00, 90, 'Bebidas'),
('Água Mineral', 'Água mineral com gás, garrafa de 1,5L', 1.30, 2.50, 200, 'Bebidas'),
('Papel Higiênico', 'Papel higiênico, pacote com 12 unidades', 8.50, 15.00, 180, 'Higiene e Limpeza'),
('Detergente', 'Detergente líquido, 500ml, para limpeza geral', 2.20, 3.80, 160, 'Higiene e Limpeza'),
('Sabão em Pó', 'Sabão em pó, embalagem de 1kg, para lavar roupas', 4.50, 8.50, 140, 'Higiene e Limpeza'),
('Alvejante', 'Alvejante para roupas, 1L, elimina manchas e germes', 3.00, 5.60, 120, 'Higiene e Limpeza'),
('Desinfetante', 'Desinfetante líquido, 500ml, para limpar e perfumar', 2.00, 4.20, 100, 'Higiene e Limpeza'),
('Esponja de Aço', 'Esponja de aço, pacote com 5 unidades', 1.50, 3.00, 250, 'Higiene e Limpeza'),
('Papel Toalha', 'Papel toalha, pacote com 2 rolos', 3.00, 5.00, 130, 'Higiene e Limpeza'),
('Fraldas Descartáveis', 'Fraldas descartáveis, pacote com 30 unidades', 28.00, 45.00, 50, 'Higiene e Limpeza'),
('Sabonete', 'Sabonete em barra, 90g, fragrância suave', 1.10, 2.20, 200, 'Higiene e Limpeza'),
('Shampoo', 'Shampoo para cabelos normais, 400ml', 6.50, 12.00, 90, 'Higiene e Limpeza'),
('Condicionador', 'Condicionador para cabelos normais, 400ml', 6.50, 12.00, 95, 'Higiene e Limpeza'),
('Sabonete Líquido', 'Sabonete líquido para mãos, 300ml, fragrância de erva doce', 4.00, 6.50, 110, 'Higiene e Limpeza'),
('Alcool Gel', 'Álcool gel 70%, 500ml, para higiene das mãos', 5.00, 8.00, 160, 'Higiene e Limpeza'),
('Chá Verde', 'Chá verde em sachês, caixa com 20 unidades', 5.20, 9.00, 80, 'Bebidas'),
('Achocolatado', 'Achocolatado em pó, embalagem de 400g', 4.90, 8.00, 100, 'Bebidas'),
('Biscoito Recheado', 'Biscoito recheado de chocolate, pacote 300g', 3.50, 6.80, 140, 'Alimentos'),
('Biscoito Salgado', 'Biscoito salgado tipo água e sal, pacote 400g', 2.80, 5.00, 150, 'Alimentos'),
('Granola', 'Granola com frutas secas, embalagem 500g', 7.00, 13.00, 85, 'Alimentos'),
('Azeite de Oliva', 'Azeite de oliva extra virgem, 500ml', 15.00, 25.00, 60, 'Alimentos'),
('Macarrão Instantâneo', 'Macarrão instantâneo sabor galinha caipira, embalagem de 80g', 1.10, 2.00, 200, 'Alimentos'),
('Purê de Batata', 'Purê de batata pronto, fácil de preparar, embalagem 500g', 3.20, 6.00, 130, 'Alimentos'),
('Molho de Soja', 'Molho de soja para temperar, garrafa de 150ml', 2.50, 4.50, 90, 'Alimentos'),
('Cereal Matinal', 'Cereal matinal integral, embalagem 300g', 6.00, 10.00, 100, 'Alimentos'),
('Manteiga', 'Manteiga com sal, embalagem 200g', 5.40, 9.00, 110, 'Laticínios'),
('Queijo Parmesão', 'Queijo parmesão ralado, embalagem 100g', 7.80, 14.00, 60, 'Laticínios'),
('Leite Condensado', 'Leite condensado, lata de 395g', 4.20, 7.50, 150, 'Alimentos'),
('Creme de Leite', 'Creme de leite fresco, embalagem 200g', 3.50, 6.50, 120, 'Laticínios'),
('Pão de Forma', 'Pão de forma tradicional, embalagem com 10 fatias', 2.90, 4.50, 180, 'Alimentos'),
('Pão Francês', 'Pão francês, pacote com 10 unidades', 1.50, 3.50, 200, 'Alimentos'),
('Frango Desossado', 'Frango desossado, pacote com 1kg', 10.50, 18.00, 60, 'Carnes'),
('Carne Bovina', 'Carne bovina, corte para churrasco, pacote 1kg', 18.00, 35.00, 50, 'Carnes'),
('Linguiça Calabresa', 'Linguiça calabresa, embalagem 500g', 9.00, 15.00, 80, 'Carnes'),
('Bacon', 'Bacon em tiras, embalagem 400g', 8.50, 14.50, 70, 'Carnes'),
('Salsicha', 'Salsicha tipo Viena, embalagem 500g', 4.20, 7.50, 100, 'Carnes'),
('Picanha', 'Picanha bovina, corte premium, 1kg', 40.00, 75.00, 30, 'Carnes'),
('Peito de Frango', 'Peito de frango desfiado, embalagem 500g', 7.80, 13.50, 85, 'Carnes'),
('Peixe Congelado', 'Peixe congelado, filé de tilápia, embalagem 500g', 12.00, 22.00, 50, 'Carnes'),
('Mussarela de Búfala', 'Mussarela de búfala, 250g', 12.50, 20.00, 40, 'Laticínios'),
('Goiabada', 'Goiabada cascão, embalagem 500g', 5.50, 9.80, 90, 'Doces'),
('Chocolate ao Leite', 'Chocolate ao leite, barra de 150g', 4.30, 8.00, 120, 'Doces'),
('Balas de Fruta', 'Balas de fruta, embalagem 300g', 3.00, 6.50, 150, 'Doces'),
('Biscoito de Polvilho', 'Biscoito de polvilho, embalagem 400g', 3.50, 6.20, 130, 'Alimentos'),
('Coco Ralado', 'Coco ralado desidratado, embalagem 200g', 2.80, 5.00, 100, 'Alimentos'),
('Alho', 'Alho fresco, cabeça, unidade', 1.20, 2.50, 200, 'Hortifrúti'),
('Cebola', 'Cebola, unidade média', 0.90, 2.00, 180, 'Hortifrúti'),
('Tomate', 'Tomate, unidade média', 2.00, 4.00, 150, 'Hortifrúti'),
('Alface', 'Alface americana, unidade', 1.50, 3.00, 120, 'Hortifrúti'),
('Cenoura', 'Cenoura, unidade média', 1.00, 2.30, 200, 'Hortifrúti'),
('Batata Inglesa', 'Batata inglesa, pacote de 1kg', 4.00, 7.50, 150, 'Hortifrúti'),
('Abobrinha', 'Abobrinha italiana, unidade', 1.80, 3.50, 110, 'Hortifrúti'),
('Pepino', 'Pepino, unidade média', 1.20, 2.50, 180, 'Hortifrúti'),
('Laranja', 'Laranja pera, unidade', 1.50, 3.00, 200, 'Frutas'),
('Maçã', 'Maçã gala, unidade', 0.70, 1.50, 200, 'Frutas'),
('Banana', 'Banana prata, cacho pequeno', 1.20, 2.50, 180, 'Frutas'),
('Uva', 'Uva sem sementes, embalagem 500g', 5.00, 9.00, 100, 'Frutas'),
('Abacaxi', 'Abacaxi pérola, unidade', 2.80, 5.00, 70, 'Frutas'),
('Limão', 'Limão taiti, unidade', 0.60, 1.20, 250, 'Frutas'),
('Mamão', 'Mamão papaya, unidade', 2.00, 3.80, 90, 'Frutas'),
('Manga', 'Manga Tommy, unidade', 1.50, 3.00, 120, 'Frutas'),
('Melancia', 'Melancia, unidade média', 7.00, 12.00, 40, 'Frutas'),
('Pera', 'Pera portuguesa, unidade', 1.20, 2.50, 160, 'Frutas'),
('Kiwi', 'Kiwi, unidade', 1.80, 3.50, 80, 'Frutas'),
('Aveia em Flocos', 'Aveia em flocos, embalagem 500g', 3.00, 5.50, 130, 'Alimentos'),
('Mel', 'Mel silvestre, frasco de 500g', 10.00, 18.00, 50, 'Alimentos'),
('Amendoim Torrado', 'Amendoim torrado sem casca, embalagem 200g', 3.20, 6.00, 90, 'Alimentos'),
('Castanha de Caju', 'Castanha de caju torrada, 150g', 7.50, 13.00, 70, 'Alimentos'),
('Nozes', 'Nozes sem casca, 200g', 9.80, 16.50, 60, 'Alimentos'),
('Cerveja Pilsen', 'Cerveja pilsen lata, 350ml', 1.80, 3.50, 200, 'Bebidas'),
('Vinho Tinto', 'Vinho tinto seco, garrafa de 750ml', 15.00, 25.00, 30, 'Bebidas'),
('Suco de Uva Integral', 'Suco de uva integral, garrafa de 1L', 8.00, 13.50, 60, 'Bebidas'),
('Água de Coco', 'Água de coco natural, 500ml', 4.00, 7.00, 120, 'Bebidas'),
('Vodka', 'Vodka destilada, garrafa de 1L', 20.00, 35.00, 50, 'Bebidas'),
('Farinha de Trigo', 'Farinha de trigo, pacote de 1kg', 2.50, 4.50, 150, 'Alimentos'),
('Fermento em Pó', 'Fermento químico em pó, 100g', 1.20, 2.50, 100, 'Alimentos'),
('Arroz Integral', 'Arroz integral, embalagem 1kg', 4.50, 7.80, 80, 'Alimentos'),
('Flocos de Milho', 'Flocos de milho sem açúcar, 250g', 2.20, 4.00, 140, 'Alimentos'),
('Biscoito Integral', 'Biscoito integral de aveia e mel, pacote 200g', 3.50, 6.80, 110, 'Alimentos'),
('Iogurte Natural', 'Iogurte natural integral, pote de 170g', 1.50, 3.00, 150, 'Laticínios'),
('Requeijão', 'Requeijão cremoso, pote de 200g', 4.50, 7.90, 90, 'Laticínios'),
('Bacon em Cubos', 'Bacon em cubos, embalagem 200g', 4.80, 8.50, 100, 'Carnes'),
('Carne Moída', 'Carne bovina moída, pacote 500g', 7.50, 12.50, 80, 'Carnes'),
('Frango a Passarinho', 'Frango a passarinho congelado, 1kg', 5.80, 10.00, 90, 'Carnes'),
('Hambúrguer Bovino', 'Hambúrguer bovino congelado, embalagem com 4 unidades', 5.00, 9.00, 120, 'Carnes'),
('Salsicha Viena', 'Salsicha tipo Viena, pacote 1kg', 8.50, 14.00, 60, 'Carnes');

CREATE TABLE IF NOT EXISTS tb_venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    CLIENTE_id_cliente INT NOT NULL,
    data_venda DATETIME,
    desconto_venda INT UNSIGNED,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente)
);

select * from tb_cliente;

INSERT INTO tb_venda (CLIENTE_id_cliente, data_venda, desconto_venda) VALUES
(1, '2023-01-15 10:30:00', 10),
(2, '2023-01-18 11:45:00', 15),
(3, '2023-02-10 12:20:00', 5),
(4, '2023-03-05 14:30:00', 20),
(5, '2023-04-12 16:10:00', 10),
(6, '2023-05-20 09:50:00', 12),
(12, '2023-06-22 08:40:00', 18),
(13, '2023-07-15 13:15:00', 25),
(14, '2023-08-30 17:00:00', 30),
(15, '2023-09-05 15:45:00', 10),
(1, '2023-09-20 10:20:00', 5),
(2, '2023-10-01 11:25:00', 12),
(3, '2023-10-15 14:00:00', 8),
(4, '2023-10-25 15:30:00', 20),
(5, '2023-11-01 17:15:00', 15),
(6, '2023-11-10 09:10:00', 5),
(12, '2023-11-15 10:50:00', 18),
(13, '2023-11-20 11:55:00', 30),
(14, '2023-11-25 14:20:00', 20),
(15, '2023-12-01 16:45:00', 10);

CREATE TABLE IF NOT EXISTS tb_venda_produto (
    VENDA_id_venda INT NOT NULL,
    PRODUTO_produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    desconto_item INT UNSIGNED,
    PRIMARY KEY (VENDA_id_venda, PRODUTO_produto_id),
    FOREIGN KEY (VENDA_id_venda) REFERENCES tb_venda(id_venda),
    FOREIGN KEY (PRODUTO_produto_id) REFERENCES tb_produto(id_produto)
);

INSERT INTO tb_venda_produto (VENDA_id_venda, PRODUTO_produto_id, quantidade, preco_unitario, desconto_item) VALUES
(1, 1, 2, 10.00, 5),
(1, 2, 1, 15.50, 0),
(1, 3, 3, 8.75, 10),
(2, 1, 1, 10.00, 0),
(2, 4, 4, 12.00, 15),
(2, 5, 2, 6.50, 0),
(3, 2, 5, 15.50, 20),
(3, 3, 2, 8.75, 0),
(3, 6, 1, 25.00, 5),
(4, 4, 2, 12.00, 10),
(4, 5, 3, 6.50, 0),
(4, 7, 1, 18.00, 5),
(5, 1, 2, 10.00, 0),
(5, 8, 1, 20.00, 15),
(6, 2, 1, 15.50, 10),
(6, 6, 2, 25.00, 0),
(6, 9, 1, 30.00, 20),
(7, 3, 4, 8.75, 5),
(7, 5, 2, 6.50, 0),
(7, 10, 1, 50.00, 0),
(8, 4, 1, 12.00, 15),
(8, 8, 2, 20.00, 0),
(9, 1, 3, 10.00, 5),
(9, 9, 2, 30.00, 0),
(10, 2, 1, 15.50, 10),
(10, 7, 2, 18.00, 5),
(11, 3, 1, 8.75, 0),
(11, 10, 3, 50.00, 10),
(12, 5, 2, 6.50, 0),
(12, 6, 1, 25.00, 20);

-- 11. Crie uma VIEW chamada "vw_clientes_aniversariantes" que exibe o nome do cliente, telefone, e mês de nascimento, para clientes que fazem aniversário no primeiro semestre (janeiro a junho).
CREATE VIEW vw_clientes_aniversariantes AS
SELECT nome_cliente, telefone_cliente,
MONTH(data_nascimento) AS mes_nascimento
FROM tb_cliente
WHERE MONTH(data_nascimento) <= 6;

SELECT * FROM vw_clientes_aniversariantes;

-- 12. Crie uma VIEW chamada "vw_produtos_lucro" que exibe o nome do produto, categoria e o lucro bruto de cada produto (preco_venda - preco_compra) apenas para os produtos com estoque superior a 50 unidades.
CREATE VIEW vw_produtos_lucro AS
SELECT nome_produto, categoria, estoque,
preco_venda - preco_compra AS lucro_bruto
FROM tb_produto
WHERE estoque > 50;

SELECT * FROM vw_produtos_lucro;

-- 13. Crie uma VIEW chamada "vw_clientes_mais_lucrativos" que exibe o nome do cliente, telefone, cidade, estado e a soma do lucro bruto de todos os produtos com estoque menor que 50 vendidos para clientes que moram em estados do Sudeste (SP, RJ, MG, ES).
CREATE VIEW vw_clientes_mais_lucrativos AS
SELECT tb_cliente.nome_cliente, tb_cliente.telefone_cliente, tb_cliente.cidade, tb_cliente.estado,
preco_venda - preco_compra AS lucro_bruto,
SUM(lucro_bruto), 
tb_produto.estoque, tb_produto.nome_produto
FROM tb_cliente
JOIN tb_venda_produto
ON tb_cliente.CLIENTE_id_cliente = tb_venda.id_venda
JOIN tb_cliente
ON tb_produto.id_produto = tb_venda_produto.PRODUTO_produto_id
WHERE tb_produto.estoque < 50
AND tb_cliente.cidade = 'SP' OR 'RJ' OR 'MG' OR 'ES'
GROUP BY tb_cliente.nome_cliente;
-- ORDER BY nome_cliente;

DROP VIEW vw_clientes_mais_lucrativos;

SELECT * FROM vw_clientes_mais_lucrativos;

-- 14. Usando a view "vw_clientes_aniversariantes", selecione os nomes dos clientes que fazem aniversário em um mês ímpar e ordene pelo mês de nascimento. Utilize uma condição para exibir o mês por extenso (ex: 'Janeiro', 'Março', etc.).
CREATE VIEW vw_clientes_aniversariantes AS
SELECT nome_cliente, 
CASE MONTH(data_nascimento) % 2 WHEN 1
THEN 'IMPAR' END AS mes_nascimento,
CASE MONTH(data_nascimento)
WHEN 1 THEN 'JANEIRO'
WHEN 3 THEN 'MARÇO'
WHEN 5 THEN 'MAIO'
WHEN 7 THEN 'JULHO'
WHEN 9 THEN 'SETEMBRO'
WHEN 11 THEN 'NOVEMBRO'
END AS mes_impar
FROM tb_cliente;

DROP VIEW vw_clientes_aniversariantes;

SELECT * FROM vw_clientes_aniversariantes;

-- 15. Usando as views "vw_produtos_lucro" e "vw_clientes_mais_lucrativos", selecione os nomes dos clientes e o lucro total de produtos da categoria 'Alimentos' vendidos para esses clientes, mas apenas para aqueles que geraram lucro acima de 100. Ordene pelo lucro em ordem decrescente.

