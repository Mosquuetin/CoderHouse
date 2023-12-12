---------------------------------------------------------------------
USE bancoprivado;

---------------------------------------------------------------------
INSERT INTO cliente (primeiro_nome, ultimo_nome, telefone, email)
VALUES
    ('João', 'Silva', '1123456789', 'joao.silva@email.com'),
    ('Maria', 'Pereira', '2298765432', 'maria.pereira@email.com'),
    ('Carlos', 'Santos', '3355551234', 'carlos.santos@email.com'),
    ('Ana', 'Ferreira', '4477774321', 'ana.ferreira@email.com'),
    ('Pedro', 'Oliveira', '5533334444', 'pedro.oliveira@email.com'),
    ('Julia', 'Ribeiro', '6654321234', 'julia.ribeiro@email.com'),
    ('Antonio', 'Gomes', '7788887777', 'antonio.gomes@email.com'),
    ('Luiza', 'Cruz', '8833221100', 'luiza.cruz@email.com'),
    ('Lucas', 'Machado', '9932116677', 'lucas.machado@email.com'),
    ('Mariana', 'Fonseca', '2255334422', 'mariana.fonseca@email.com'),
    ('Gustavo', 'Costa', '3399885522', 'gustavo.costa@email.com'),
    ('Isabella', 'Nunes', '4488993311', 'isabella.nunes@email.com'),
    ('Rafael', 'Pinto', '5588771144', 'rafael.pinto@email.com'),
    ('Eduarda', 'Almeida', '6655442288', 'eduarda.almeida@email.com'),
    ('Felipe', 'Vieira', '7777112299', 'felipe.vieira@email.com'),
    ('Larissa', 'Carvalho', '8833226633', 'larissa.carvalho@email.com'),
    ('Leonardo', 'Rodrigues', '9999221100', 'leonardo.rodrigues@email.com'),
    ('Vitor', 'Melo', '1111553322', 'vitor.melo@email.com'),
    ('Sofia', 'Barbosa', '2222773322', 'sofia.barbosa@email.com'),
    ('Enzo', 'Araújo', '4444667733', 'enzo.araujo@email.com'),
    ('Valentina', 'Dias', '5555997733', 'valentina.dias@email.com'),
    ('Davi', 'Rocha', '8888110066', 'davi.rocha@email.com'),
    ('Laura', 'Fernandes', '9999112233', 'laura.fernandes@email.com'),
    ('Matheus', 'Sousa', '1133556677', 'matheus.sousa@email.com'),
    ('Manuela', 'Azevedo', '2244887722', 'manuela.azevedo@email.com'),
    ('Pedro', 'Oliveira', '3333221100', 'pedro.oliveira@email.com'),
    ('Alice', 'Mendes', '4444229988', 'alice.mendes@email.com'),
    ('Guilherme', 'Alves', '5555118844', 'guilherme.alves@email.com'),
    ('Sophia', 'Couto', '6655223300', 'sophia.couto@email.com'),
    ('Eduardo', 'Vargas', '7777223366', 'eduardo.vargas@email.com');

SELECT * FROM cliente;

---------------------------------------------------------------------
INSERT INTO conta_cliente (id_cliente, agencia)
VALUES
    (10, 6), 
    (28, 8), 
    (22, 4), 
    (6, 2), 
    (17, 7), 
    (12, 9), 
    (31, 6), 
    (9, 3), 
    (18, 5), 
    (3, 6),
    (29, 10), 
    (8, 5), 
    (21, 3), 
    (13, 7), 
    (5, 4), 
    (15, 7), 
    (20, 9), 
    (7, 1), 
    (25, 10), 
    (16, 7),
    (30, 2), 
    (2, 9), 
    (19, 5), 
    (11, 9), 
    (24, 8), 
    (4, 4), 
    (27, 10), 
    (1, 10), 
    (14, 3), 
    (23, 5),
    (26, 6), 
    (10, 8), 
    (28, 1), 
    (22, 10), 
    (6, 5), 
    (17, 2), 
    (12, 3), 
    (31, 4), 
    (9, 10), 
    (18, 2), 
    (3, 5);

INSERT INTO conta_cliente (id_cliente, agencia)
VALUES
    (14,10),
    (15,2),
    (16,4),
    (19,8),
    (20,2),
    (21,4),
    (23,5),
    (24,1),
    (25,3),
    (26,7),
    (27,9),
    (30,3);

UPDATE conta_cliente
SET saldo = 0, fatura_credito = 0;

SELECT * FROM conta_cliente;

---------------------------------------------------------------------
INSERT INTO cartao_credito (id_conta_cliente, status)
VALUES
  (2, 'Ativo'),
  (4, 'Arivo'),
  (6, 'Ativo'),
  (8, 'Ativo'),
  (10, 'Arivo'),
  (12, 'Ativo'),
  (14, 'Arivo'),
  (16, 'Ativo'),
  (18, 'Arivo'),
  (20, 'Ativo'),
  (22, 'Arivo'),
  (24, 'Ativo'),
  (26, 'Ativo'),
  (28, 'Ativo'),
  (30, 'Ativo'),
  (32, 'Arivo'),
  (34, 'Ativo'),
  (36, 'Ativo'),
  (38, 'Arivo'),
  (40, 'Ativo');

INSERT INTO cartao_credito (id_conta_cliente, status)
VALUES
  ((4-1), 'Ativo'),
  ((6-1), 'Ativo'),
  ((8-1), 'Ativo'),
  ((10-1), 'Ativo'),
  ((12-1), 'Ativo'),
  ((14-1), 'Ativo'),
  ((16-1), 'Ativo'),
  ((18-1), 'Ativo'),
  ((20-1), 'Ativo'),
  ((22-1), 'Ativo'),
  ((24-1), 'Ativo'),
  ((26-1), 'Ativo'),
  ((28-1), 'Ativo'),
  ((30-1), 'Ativo'),
  ((32-1), 'Ativo'),
  ((34-1), 'Ativo'),
  ((36-1), 'Ativo'),
  ((38-1), 'Ativo'),
  ((40-1), 'Ativo');


UPDATE cartao_credito
SET status = 'Ativo';

INSERT INTO cartao_credito (id_conta_cliente, status)
VALUES
  (41, 'Desativo'),
  (42, 'Desativo'),
  (43, 'Desativo'),
  (44, 'Desativo'),
  (45, 'Desativo'),
  (46, 'Desativo'),
  (47, 'Desativo'),
  (48, 'Desativo'),
  (49, 'Desativo'),
  (50, 'Desativo'),
  (51, 'Desativo'),
  (52, 'Desativo'),
  (53, 'Desativo'),
  (54, 'Desativo');

SELECT * FROM cartao_credito;

---------------------------------------------------------------------
INSERT INTO cartao_debito (id_conta_cliente, status)
VALUES
  (2, 'Ativo'),
  (4, 'Arivo'),
  (6, 'Ativo'),
  (8, 'Ativo'),
  (10, 'Arivo'),
  (12, 'Ativo'),
  (14, 'Arivo'),
  (16, 'Ativo'),
  (18, 'Arivo'),
  (20, 'Ativo'),
  (22, 'Arivo'),
  (24, 'Ativo'),
  (26, 'Ativo'),
  (28, 'Ativo'),
  (30, 'Ativo'),
  (32, 'Arivo'),
  (34, 'Ativo'),
  (36, 'Ativo'),
  (38, 'Arivo'),
  (40, 'Ativo');

INSERT INTO cartao_debito (id_conta_cliente, status)
VALUES
  ((4-1), 'Ativo'),
  ((6-1), 'Ativo'),
  ((8-1), 'Ativo'),
  ((10-1), 'Ativo'),
  ((12-1), 'Ativo'),
  ((14-1), 'Ativo'),
  ((16-1), 'Ativo'),
  ((18-1), 'Ativo'),
  ((20-1), 'Ativo'),
  ((22-1), 'Ativo'),
  ((24-1), 'Ativo'),
  ((26-1), 'Ativo'),
  ((28-1), 'Ativo'),
  ((30-1), 'Ativo'),
  ((32-1), 'Ativo'),
  ((34-1), 'Ativo'),
  ((36-1), 'Ativo'),
  ((38-1), 'Ativo'),
  ((40-1), 'Ativo');

UPDATE cartao_debito
SET status = 'Ativo';

INSERT INTO cartao_debito (id_conta_cliente, status)
VALUES
  (41, 'Desativo'),
  (42, 'Desativo'),
  (43, 'Desativo'),
  (44, 'Desativo'),
  (45, 'Desativo'),
  (46, 'Desativo'),
  (47, 'Desativo'),
  (48, 'Desativo'),
  (49, 'Desativo'),
  (50, 'Desativo'),
  (51, 'Desativo'),
  (52, 'Desativo'),
  (53, 'Desativo'),
  (54, 'Desativo');

SELECT * FROM cartao_debito;

---------------------------------------------------------------------
DELETE FROM transacoes;

INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES
  (1, 1, 1, 100.0, 'Credito', 'Compra de Eletrônicos', 'Americanas - São Paulo - SP'),
  (10, 2, 3, 50.42, 'Debito', 'Compra de Roupas', 'C&A - Rio de Janeiro - RJ'),
  (28, 3, 3, 75.0, 'Credito', 'Compra de Livros', 'Leitura - Belo Horizonte - MG'),
  (22, 4, 5, 30.36, 'Debito', 'Restaurante', 'Outback - Brasília - DF'),
  (6, 5, 5, 200.0, 'Credito', 'Compra de Eletrônicos', 'Amazon - Porto Alegre - RS'),
  (17, 6, 7, 15.0, 'Debito', 'Posto de Gasolina', 'Posto Petrobras - Salvador - BA'),
  (12, 7, 7, 125.0, 'Credito', 'Compra de Móveis', 'MadeiraMadeira - Florianópolis - SC'),
  (31, 8, 9, 45.84, 'Debito', 'Supermercado', 'Extra Mercado - Recife - PE'),
  (9, 9, 9, 40.0, 'Credito', 'Compra de Eletrônicos', 'Casas Bahia - Campinas - SP'),
  (18, 10, 11, 80.97, 'Debito', 'Restaurante', 'Madero - Florianópolis - SC'),
  (3, 11, 11, 110.0, 'Credito', 'Compra de Roupas', 'Zattini - Belo Horizonte - MG'),
  (29, 12, 13, 25.0, 'Debito', 'Supermercado', 'Extra Mercado - Brasília - DF'),
  (8, 13, 13, 65.63, 'Credito', 'Posto de Gasolina', 'Posto Shell - Porto Alegre - RS'),
  (21, 14, 15, 120.0, 'Debito', 'Compra de Livros', 'Amazon - Rio de Janeiro - RJ'),
  (13, 15, 15, 15.87, 'Credito', 'Farmácia', 'Drogasil - Recife - PE'),
  (5, 16, 17, 95.0, 'Debito', 'Restaurante', 'Outback - Manaus - AM'),
  (15, 17, 17, 150.0, 'Credito', 'Loja de Eletrônicos', 'Casas Bahia - Salvador - BA'),
  (20, 18, 19, 35.35, 'Debito', 'Supermercado', 'Carrefour - Fortaleza - CE'),
  (7, 19, 18, 70.99, 'Credito', 'Posto de Gasolina', 'Posto Petrobras - Goiânia - GO'),
  (25, 20, 21, 20.0, 'Debito', 'Restaurante', 'Madero - Belém - PA'),
  (16, 21, 21, 125.42, 'Credito', 'Compra de Roupas', 'C&A - São Luís - MA'),
  (30, 22, 23, 60.0, 'Debito', 'Supermercado', 'Carrefour - Porto Velho - RO'),
  (2, 23, 23, 85.0, 'Credito', 'Posto de Gasolina', 'Posto Petrobras - Curitiba - PR'),
  (19, 24, 25, 30.0, 'Debito', 'Restaurante', 'Coco Bambu - Cuiabá - MT'),
  (11, 25, 25, 115.0, 'Credito', 'Compra de Eletrônicos', 'Mercado Livre - Teresina - PI'),
  (24, 26, 27, 45.28, 'Debito', 'Supermercado', 'Extra Mercado - João Pessoa - PB'),
  (4, 27, 27, 25.0, 'Credito', 'Farmácia', 'Araujo - Vitória - ES'),
  (27, 28, 29, 70.0, 'Debito', 'Restaurante', 'Coco Bambu - Aracaju - SE'),
  (1, 29, 29, 90.0, 'Credito', 'Compra de Roupas', 'Zattini - Natal - RN'),
  (14, 30, 31, 110.45, 'Debito', 'Supermercado', 'Carrefour - Boa Vista - RR'),
  (23, 31, 31, 75.0, 'Credito', 'Posto de Gasolina', 'Posto Shell - Palmas - TO'),
  (26, 32, 33, 40.99, 'Debito', 'Restaurante', 'Outback - Rio Branco - AC'),
  (10, 33, 33, 115.87, 'Credito', 'Compra de Eletrônicos', 'Amazon - Macapá - AP'),
  (28, 34, 35, 60.56, 'Debito', 'Supermercado', 'Carrefour - Acreúna - GO'),
  (22, 35, 35, 30.34, 'Credito', 'Farmácia', 'Drogasil - Bertioga - SP'),
  (6, 36, 38, 90.0, 'Debito', 'Compra de Roupas', 'Zattini - Natal - RN'),
  (17, 37, 37, 110.45, 'Credito', 'Supermercado', 'Carrefour - Boa Vista - RR'),
  (12, 38, 39, 75.0, 'Debito', 'Posto de Gasolina', 'Posto Shell - Palmas - TO'),
  (31, 39, 38, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC'),
  (9, 40, 41, 115.87, 'Debito', 'Compra de Eletrônicos', 'Amazon - Macapá - AP'),
  (5, 39, 39, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC');
INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES
  (1, 1, 1, 100.0, 'Credito', 'Compra de Eletrônicos', 'Americanas - São Paulo - SP'),
  (10, 2, 3, 50.42, 'Debito', 'Compra de Roupas', 'C&A - Rio de Janeiro - RJ'),
  (28, 3, 3, 75.0, 'Credito', 'Compra de Livros', 'Leitura - Belo Horizonte - MG'),
  (22, 4, 5, 30.36, 'Debito', 'Restaurante', 'Outback - Brasília - DF'),
  (6, 5, 5, 200.0, 'Credito', 'Compra de Eletrônicos', 'Amazon - Porto Alegre - RS'),
  (17, 6, 7, 15.0, 'Debito', 'Posto de Gasolina', 'Posto Petrobras - Salvador - BA'),
  (12, 7, 7, 125.0, 'Credito', 'Compra de Móveis', 'MadeiraMadeira - Florianópolis - SC'),
  (31, 8, 9, 45.84, 'Debito', 'Supermercado', 'Extra Mercado - Recife - PE'),
  (9, 9, 9, 40.0, 'Credito', 'Compra de Eletrônicos', 'Casas Bahia - Campinas - SP'),
  (18, 10, 11, 80.97, 'Debito', 'Restaurante', 'Madero - Florianópolis - SC'),
  (3, 11, 11, 110.0, 'Credito', 'Compra de Roupas', 'Zattini - Belo Horizonte - MG'),
  (29, 12, 13, 25.0, 'Debito', 'Supermercado', 'Extra Mercado - Brasília - DF'),
  (8, 13, 13, 65.63, 'Credito', 'Posto de Gasolina', 'Posto Shell - Porto Alegre - RS'),
  (21, 14, 15, 120.0, 'Debito', 'Compra de Livros', 'Amazon - Rio de Janeiro - RJ'),
  (13, 15, 15, 15.87, 'Credito', 'Farmácia', 'Drogasil - Recife - PE'),
  (5, 16, 17, 95.0, 'Debito', 'Restaurante', 'Outback - Manaus - AM'),
  (15, 17, 17, 150.0, 'Credito', 'Loja de Eletrônicos', 'Casas Bahia - Salvador - BA'),
  (20, 18, 19, 35.35, 'Debito', 'Supermercado', 'Carrefour - Fortaleza - CE'),
  (7, 19, 18, 70.99, 'Credito', 'Posto de Gasolina', 'Posto Petrobras - Goiânia - GO'),
  (25, 20, 21, 20.0, 'Debito', 'Restaurante', 'Madero - Belém - PA'),
  (16, 21, 21, 125.42, 'Credito', 'Compra de Roupas', 'C&A - São Luís - MA'),
  (30, 22, 23, 60.0, 'Debito', 'Supermercado', 'Carrefour - Porto Velho - RO'),
  (2, 23, 23, 85.0, 'Credito', 'Posto de Gasolina', 'Posto Petrobras - Curitiba - PR'),
  (19, 24, 25, 30.0, 'Debito', 'Restaurante', 'Coco Bambu - Cuiabá - MT'),
  (11, 25, 25, 115.0, 'Credito', 'Compra de Eletrônicos', 'Mercado Livre - Teresina - PI'),
  (24, 26, 27, 45.28, 'Debito', 'Supermercado', 'Extra Mercado - João Pessoa - PB'),
  (4, 27, 27, 25.0, 'Credito', 'Farmácia', 'Araujo - Vitória - ES'),
  (27, 28, 29, 70.0, 'Debito', 'Restaurante', 'Coco Bambu - Aracaju - SE'),
  (1, 29, 29, 90.0, 'Credito', 'Compra de Roupas', 'Zattini - Natal - RN'),
  (14, 30, 31, 110.45, 'Debito', 'Supermercado', 'Carrefour - Boa Vista - RR'),
  (23, 31, 31, 75.0, 'Credito', 'Posto de Gasolina', 'Posto Shell - Palmas - TO'),
  (26, 32, 33, 40.99, 'Debito', 'Restaurante', 'Outback - Rio Branco - AC'),
  (10, 33, 33, 115.87, 'Credito', 'Compra de Eletrônicos', 'Amazon - Macapá - AP'),
  (28, 34, 35, 60.56, 'Debito', 'Supermercado', 'Carrefour - Acreúna - GO'),
  (22, 35, 35, 30.34, 'Credito', 'Farmácia', 'Drogasil - Bertioga - SP'),
  (6, 36, 38, 90.0, 'Debito', 'Compra de Roupas', 'Zattini - Natal - RN'),
  (17, 37, 37, 110.45, 'Credito', 'Supermercado', 'Carrefour - Boa Vista - RR'),
  (12, 38, 39, 75.0, 'Debito', 'Posto de Gasolina', 'Posto Shell - Palmas - TO'),
  (31, 39, 38, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC'),
  (9, 40, 41, 115.87, 'Debito', 'Compra de Eletrônicos', 'Amazon - Macapá - AP'),
  (5, 39, 39, 40.99, 'Credito', 'Restaurante', 'Outback - Rio Branco - AC');

SELECT * FROM transacoes;

SELECT * FROM conta_cliente;

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_credito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT IFNULL(SUM(CASE WHEN tipo = 'Credito' THEN valor ELSE 0 END), 0) INTO valor_total
    FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Credito';
    IF valor_total > 0 THEN
        UPDATE conta_cliente
        SET fatura_credito = valor_total
        WHERE id = NEW.id_conta_cliente;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_debito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT IFNULL(SUM(CASE WHEN tipo = 'Debito' THEN valor ELSE 0 END), 0) INTO valor_total
    FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Debito';

    IF valor_total > 0 THEN
        UPDATE conta_cliente
        SET saldo = -(valor_total)
        WHERE id = NEW.id_conta_cliente;
    END IF;
END;
//
DELIMITER ;
