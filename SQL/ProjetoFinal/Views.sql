USE bancoprivado;

SELECT * FROM transacoes;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_cidade
AS
SELECT  SUBSTRING_INDEX(SUBSTRING_INDEX(info_pagamento, ' - ', 2), ' - ', -1) AS cidade,
        ROUND(SUM(valor),2) AS valor_total
FROM transacoes
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_cidade;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_estado
AS
SELECT  SUBSTRING_INDEX(SUBSTRING_INDEX(info_pagamento, ' - ', 3), ' - ', -1) AS estado,
        ROUND(SUM(valor),2) AS valor_total
FROM transacoes
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_estado;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_loja
AS
SELECT  SUBSTRING_INDEX(SUBSTRING_INDEX(info_pagamento, ' - ', 1), ' - ', -1) AS loja,
        ROUND(SUM(valor),2) AS valor_total
FROM transacoes
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_loja;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_cliente
AS
SELECT CONCAT(c.primeiro_nome,' ',c.ultimo_nome) AS nome_completo, ROUND(SUM(t.valor),2) AS valor_total
FROM transacoes AS t
LEFT JOIN cliente AS c ON c.id = t.id_cliente
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_cliente;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_descricao
AS
SELECT descricao AS categoria, ROUND(SUM(valor),2) AS valor_total
FROM transacoes 
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_descricao;

-------------------------------------------------------
CREATE OR REPLACE view view_total_saldo_fatura_mes
AS
SELECT MONTH(data_inclusao) AS mes_compra, ROUND(SUM(valor),2) AS valor_total
FROM transacoes
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM view_total_saldo_fatura_mes;