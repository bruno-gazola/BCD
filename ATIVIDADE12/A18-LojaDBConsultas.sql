USE LojaDB;

SELECT * FROM tb_venda;

-- 1
SELECT id_nf, id_item, cod_prod, valor_unit FROM tb_venda
WHERE desconto IS NULL;

-- 2
SELECT id_nf, id_item, cod_prod, valor_unit, valor_unit-(valor_unit*(desconto/100)) AS Valor_Vendido FROM tb_venda
WHERE desconto IS NOT NULL;

SELECT * FROM tb_venda
WHERE desconto IS NULL;

-- 3
UPDATE tb_venda 
SET desconto = 0
WHERE desconto IS NULL;

SELECT * FROM tb_venda;

-- 4
SELECT id_nf, id_item, cod_prod, valor_unit, 
quantidade * valor_unit AS valor_total, 
desconto, valor_unit-(valor_unit*(desconto/100)) AS valor_vendido FROM tb_venda
WHERE quantidade IS NOT NULL;

-- 5
SELECT id_nf, SUM(quantidade * valor_unit) AS valor_total FROM tb_venda
GROUP BY id_nf
ORDER BY valor_total DESC;

-- 6
SELECT id_nf, SUM(valor_unit-(valor_unit*(desconto/100))) AS valor_vendido
FROM tb_venda
GROUP BY id_nf
ORDER BY valor_vendido DESC;

-- 7
SELECT cod_prod, MAX(quantidade) FROM tb_venda
GROUP BY cod_prod
LIMIT 1;

-- 8
SELECT id_nf, cod_prod FROM tb_venda 
WHERE quantidade > 10
GROUP BY id_nf, cod_prod
ORDER BY id_nf, cod_prod;

-- 9
SELECT id_nf, SUM(quantidade * valor_unit) AS valor_total FROM tb_venda
GROUP BY id_nf
HAVING valor_total > 500
ORDER BY valor_total DESC;

-- 10
SELECT cod_prod, AVG(desconto) AS media FROM tb_venda
GROUP BY cod_prod;

-- 11
SELECT cod_prod, MIN(desconto) AS menor, MAX(desconto) AS maior, AVG(desconto) AS media FROM tb_venda
GROUP BY cod_prod;

-- 12
SELECT ID_NF, COUNT(ID_ITEM) AS quantidade FROM tb_venda
WHERE quantidade > 3
GROUP BY ID_NF;