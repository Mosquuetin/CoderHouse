
-- SUBLINGUAGEM TCL

USE bancoprivado;

SELECT * FROM transacoes WHERE id = 500;
START TRANSACTION;
DELETE FROM transacoes WHERE id = 500;
SELECT * FROM transacoes WHERE id = 500;
ROLLBACK; 
COMMIT; 
SELECT * FROM transacoes WHERE id = 500;


-- INSERCAO

START TRANSACTION;
INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES 
    (12, 38, 39, 75.0, 'Debito', 'Posto de Gasolina', 'Posto Shell - Palmas - TO'),
    (31, 39, 38, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC'),
    (9, 40, 41, 115.87, 'Debito', 'Compra de Eletrônicos', 'Amazon - Macapá - AP'),
    (5, 39, 39, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC');
SAVEPOINT lote_1;
INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES 
    (3, 11, 11, 110.0, 'Credito', 'Compra de Roupas', 'Zattini - Belo Horizonte - MG'),
    (29, 12, 13, 25.0, 'Debito', 'Supermercado', 'Extra Mercado - Brasília - DF'),
    (8, 13, 13, 65.63, 'Credito', 'Posto de Gasolina', 'Posto Shell - Porto Alegre - RS'),
    (21, 14, 15, 120.0, 'Debito', 'Compra de Livros', 'Amazon - Rio de Janeiro - RJ');
SAVEPOINT lote_2;

SELECT * FROM transacoes;