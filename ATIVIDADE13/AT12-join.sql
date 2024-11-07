-- Criar o banco de dados
DROP DATABASE IF EXISTS db_banco;
CREATE DATABASE IF NOT EXISTS db_banco;
USE db_banco;

-- Criar a tabela tb_contas
CREATE TABLE tb_contas (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    numero_conta VARCHAR(20) NOT NULL,
    tipo_conta ENUM('corrente', 'poupança') NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    data_abertura DATE
);

-- Criar a tabela tb_transacoes
CREATE TABLE tb_transacoes (
    id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    id_conta INT,
    tipo_transacao ENUM('depósito', 'saque', 'transferência') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_transacao DATE,
    descricao VARCHAR(255),
    FOREIGN KEY (id_conta) REFERENCES tb_contas(id_conta)
);

-- Inserir dados na tabela tb_contas
INSERT INTO tb_contas (numero_conta, tipo_conta, saldo, nome_cliente, data_abertura) VALUES
('12345-6', 'corrente', 5000.00, 'João Silva', '2022-01-15'),
('12345-7', 'poupança', 2500.00, 'Maria Souza', '2022-02-20'),
('12345-8', 'corrente', 3200.00, 'Carlos Oliveira', '2021-12-10'),
('12345-9', 'poupança', 4500.00, 'Ana Costa', '2023-03-15'),
('12346-0', 'corrente', 7000.00, 'Paula Lima', '2022-05-10'),
('12346-1', 'corrente', 10000.00, 'Fernando Moreira', '2021-07-07'),
('12346-2', 'poupança', 3000.00, 'Renata Almeida', '2023-01-05'),
('12346-3', 'corrente', 5200.00, 'Rafael Ferreira', '2021-11-12'),
('12346-4', 'poupança', 1800.00, 'Carla Pereira', '2022-06-01'),
('12346-5', 'corrente', 4000.00, 'Lucas Santos', '2022-08-19'),
('12346-6', 'poupança', 2400.00, 'Beatriz Lima', '2023-04-20'),
('12346-7', 'corrente', 3600.00, 'Juliana Mendes', '2021-10-22'),
('12346-8', 'poupança', 1500.00, 'Miguel Nogueira', '2022-12-25'),
('12346-9', 'corrente', 2800.00, 'Aline Teixeira', '2022-09-30'),
('12347-0', 'corrente', 9000.00, 'Fábio Oliveira', '2023-02-10');

-- Inserir dados na tabela tb_transacoes
INSERT INTO tb_transacoes (id_conta, tipo_transacao, valor, data_transacao, descricao) VALUES
(1, 'depósito', 1000.00, '2023-01-10', 'Depósito mensal'),
(2, 'saque', 200.00, '2023-01-11', 'Retirada para compras'),
(3, 'depósito', 500.00, '2023-01-12', 'Depósito salário'),
(4, 'saque', 300.00, '2023-01-13', 'Pagamento de contas'),
(5, 'transferência', 700.00, '2023-01-14', 'Transferência para conta 12346-4'),
(6, 'depósito', 1200.00, '2023-01-15', 'Depósito extra'),
(7, 'saque', 100.00, '2023-01-16', 'Retirada para mercado'),
(8, 'depósito', 1500.00, '2023-01-17', 'Bônus recebido'),
(9, 'saque', 250.00, '2023-01-18', 'Pagamento de contas'),
(10, 'depósito', 900.00, '2023-01-19', 'Depósito mensal'),
(11, 'transferência', 600.00, '2023-01-20', 'Transferência para poupança'),
(12, 'saque', 100.00, '2023-01-21', 'Retirada para cinema'),
(13, 'depósito', 800.00, '2023-01-22', 'Depósito mensal'),
(14, 'saque', 200.00, '2023-01-23', 'Pagamento de academia'),
(15, 'transferência', 400.00, '2023-01-24', 'Transferência para conta 12346-2'),
(1, 'saque', 500.00, '2023-01-25', 'Compras no supermercado'),
(2, 'depósito', 1000.00, '2023-01-26', 'Depósito extra'),
(3, 'saque', 150.00, '2023-01-27', 'Pagamento de contas'),
(4, 'transferência', 200.00, '2023-01-28', 'Transferência para conta 12346-0'),
(5, 'saque', 300.00, '2023-01-29', 'Retirada para compras'),
(6, 'depósito', 1100.00, '2023-01-30', 'Bônus de desempenho'),
(7, 'saque', 250.00, '2023-01-31', 'Retirada para lazer'),
(8, 'depósito', 500.00, '2023-02-01', 'Depósito mensal'),
(9, 'saque', 100.00, '2023-02-02', 'Pagamento de transporte'),
(10, 'transferência', 700.00, '2023-02-03', 'Transferência para conta 12346-7'),
(11, 'depósito', 1200.00, '2023-02-04', 'Depósito mensal'),
(12, 'saque', 400.00, '2023-02-05', 'Pagamento de contas'),
(13, 'transferência', 800.00, '2023-02-06', 'Transferência para poupança'),
(14, 'depósito', 900.00, '2023-02-07', 'Depósito extra'),
(15, 'saque', 250.00, '2023-02-08', 'Retirada para compras'),
(1, 'depósito', 600.00, '2023-02-09', 'Depósito mensal'),
(2, 'saque', 150.00, '2023-02-10', 'Pagamento de contas'),
(3, 'transferência', 700.00, '2023-02-11', 'Transferência para conta 12346-5'),
(4, 'depósito', 1100.00, '2023-02-12', 'Bônus recebido'),
(5, 'saque', 200.00, '2023-02-13', 'Pagamento de contas'),
(6, 'transferência', 300.00, '2023-02-14', 'Transferência para conta 12346-3'),
(7, 'depósito', 1200.00, '2023-02-15', 'Depósito mensal'),
(8, 'saque', 250.00, '2023-02-16', 'Retirada para lazer'),
(9, 'depósito', 800.00, '2023-02-17', 'Depósito mensal'),
(10, 'saque', 100.00, '2023-02-18', 'Pagamento de transporte'),
(11, 'transferência', 700.00, '2023-02-19', 'Transferência para poupança'),
(12, 'depósito', 500.00, '2023-02-20', 'Depósito mensal'),
(13, 'saque', 300.00, '2023-02-21', 'Pagamento de contas'),
(14, 'transferência', 200.00, '2023-02-22', 'Transferência para conta 12346-8'),
(15, 'saque', 400.00, '2023-02-23', 'Retirada para compras');

-- 1. Selecione todos os dados da tabela de contas bancárias.
SELECT * FROM tb_contas;


-- 2. Selecione o nome do cliente e o saldo das contas correntes.
SELECT tb_contas.nome_cliente, tb_contas.saldo 
FROM tb_contas
WHERE tb_contas.tipo_conta = 'corrente';


-- 3. Calcule o saldo médio das contas do tipo poupança.
SELECT AVG(tb_contas.saldo) FROM tb_contas
WHERE tb_contas.tipo_conta = 'poupança'; 


-- 4. Mostre o nome do cliente e a descrição das transações de saque.
SELECT tb_contas.nome_cliente, tb_transacoes.descricao 
FROM tb_contas 
JOIN tb_transacoes
ON tb_contas.id_conta = tb_transacoes.id_conta;


-- 5. Selecione o número da conta e o saldo, juntamente com a descrição das transações feitas.
SELECT tb_contas.numero_conta, tb_contas.saldo, tb_transacoes.descricao 
FROM tb_contas 
JOIN tb_transacoes
ON tb_contas.id_conta = tb_transacoes.id_conta;


-- 6. Mostre a contagem de transações de cada conta bancaria.
SELECT tb_contas.nome_cliente, COUNT(tb_transacoes.id_transacao) FROM tb_transacoes
JOIN tb_contas
ON tb_contas.id_conta = tb_transacoes.id_conta
GROUP BY tb_contas.nome_cliente;


-- 7. Mostre o nome do cliente e o total de valores sacados por cada um, filtrando apenas saques.
SELECT tb_contas.nome_cliente, SUM(valor) AS total_sacado FROM tb_contas 
LEFT JOIN tb_transacoes
ON tb_contas.id_conta = tb_transacoes.id_conta
WHERE tb_transacoes.tipo_transacao = 'saque'
GROUP BY tb_contas.nome_cliente;

-- 8. Mostre todas as transações com valores maiores que 500.
SELECT * FROM tb_transacoes
WHERE tb_transacoes.valor > 500;


-- 9. Selecione o nome do cliente e a data da última transação, considerando apenas saques ou depósitos.
SELECT tb_contas.nome_cliente, tb_transacoes.data_transacao FROM tb_contas 
LEFT JOIN tb_transacoes
ON tb_contas.id_conta = tb_transacoes.id_conta
WHERE tb_transacoes.tipo_transacao = 'saque' OR 'depósito'
GROUP BY tb_transacoes.data_transacao, tb_contas.nome_cliente
ORDER BY tb_transacoes.data_transacao, tb_contas.nome_cliente;


-- 10. Mostre o total de depósitos e saques feitos por cada conta bancária.
SELECT tb_contas.nome_cliente, SUM(tb_transacoes.valor) AS total_transacoes FROM tb_transacoes
JOIN tb_contas
ON tb_contas.id_conta = tb_transacoes.id_conta
WHERE tb_transacoes.tipo_transacao = 'saque' OR 'depósito'
GROUP BY tb_contas.nome_cliente
ORDER BY tb_contas.nome_cliente;