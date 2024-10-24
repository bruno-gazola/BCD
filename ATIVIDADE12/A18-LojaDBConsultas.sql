USE LojaDB;

SELECT * FROM tb_venda;

-- 1
SELECT id_nf, id_item, cod_prod, valor_unit FROM tb_venda
WHERE desconto IS NULL;

-- 2
SELECT id_nf, id_item, cod_prod, valor_unit, valor_unit-(valor_unit*(desconto/100)) AS Valor_Vendido FROM tb_venda
WHERE desconto IS NOT NULL;

-- 3
ALTER TABLE tb_venda 
CHANGE COLUMN desconto
WHERE desconto IS NULL;