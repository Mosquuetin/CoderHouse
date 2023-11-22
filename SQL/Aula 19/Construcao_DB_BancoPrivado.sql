CREATE DATABASE bancoprivado;

USE bancoprivado;

CREATE TABLE cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(255) NOT NULL,
    ultimo_nome VARCHAR(255) NOT NULL,
    telefone INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    data_incusao DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE conta_cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    agencia VARCHAR(255) NOT NULL,
    saldo FLOAT DEFAULT 0.0,
    fatura_credito FLOAT DEFAULT 0.0,
    data_incusao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacoes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_conta_cliente INT NOT NULL,
    id_cartao INT NOT NULL,
    data_incusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor FLOAT DEFAULT 0.0,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    info_pagamento VARCHAR(255) NOT NULL
);

CREATE TABLE cartao_debito(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_conta_cliente INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    data_incusao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cartao_credito(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_conta_cliente INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    data_incusao DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE cartao_debito
ADD CONSTRAINT fk_cartao_debito_conta_cliente
FOREIGN KEY (id_conta_cliente) REFERENCES conta_cliente(id);

ALTER TABLE cartao_credito
ADD CONSTRAINT fk_cartao_credito_conta_cliente
FOREIGN KEY (id_conta_cliente) REFERENCES conta_cliente(id);

ALTER TABLE conta_cliente
ADD CONSTRAINT fk_conta_cliente_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id);

ALTER TABLE transacoes
ADD CONSTRAINT fk_transacoes_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
ADD CONSTRAINT fk_transacoes_conta_cliente
FOREIGN KEY (id_conta_cliente) REFERENCES conta_cliente(id),
ADD CONSTRAINT fk_transacoes_cartao_debito
FOREIGN KEY (id_cartao) REFERENCES cartao_debito(id),
ADD CONSTRAINT fk_transacoes_cartao_credito
FOREIGN KEY (id_cartao) REFERENCES cartao_credito(id);

ALTER TABLE cliente
MODIFY COLUMN telefone VARCHAR(15);

INSERT INTO cliente (primeiro_nome, ultimo_nome, telefone, email)
VALUES ('Christopher', 'Faria', '37991213397', 'eldannyto@hotmail.com');

INSERT INTO conta_cliente (id_cliente, agencia)
VALUES ('1', '4');

INSERT INTO cartao_debito (id_conta_cliente, status)
VALUES ('1', 'Ativo');

INSERT INTO cartao_credito (id_conta_cliente, status)
VALUES ('1', 'Ativo');

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_credito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT SUM(valor) INTO valor_total FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Credito';

    UPDATE conta_cliente
    SET fatura_credito = valor_total
    WHERE id = NEW.id_conta_cliente;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_debito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT SUM(valor) INTO valor_total FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Debito';

    UPDATE conta_cliente
    SET saldo = -(valor_total)
    WHERE id = NEW.id_conta_cliente;
END;
//
DELIMITER ;

INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES ('1', '1', '1', 82.35, 'Debito', 'PAG LOJA 1', 'LOJA 1 - BH/MG');

SELECT tr.id, tr.id_cliente, tr.id_cartao, tr.valor, tr.tipo, CONCAT(cl.primeiro_nome,' ',cl.ultimo_nome) AS nome_completo
FROM transacoes AS tr
LEFT JOIN cliente AS cl ON tr.id_cliente = cl.id;


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


-- - Criação de views

-- - Quantidade de pacientes por turno - -- 
create or replace view vw_pacientes_por_turno
as
select m.id_turno, 
t.descricao_turno,
count(p.id_paciente) as 'Total paciente por turno'
from medico m 
join paciente p on p.id_medico=m.id_medico 
join turno t on t.id_turno=m.id_turno
group by 1;

-- - Detalhes da ficha médica do paciente - --
create or replace view vw_ficha_medica
as
select f.id_ficha as 'número da ficha', 
concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome completo',
p.data_nascimento,
m.descricao_medicamentos as 'nome do medicamento',
d.descricao_diagnostico as 'diagnóstico', 
e.descricao_exames as exames
from ficha_do_paciente f
join paciente p on p.id_paciente=f.id_paciente
join medicamentos m on m.id_medicamentos=f.id_medicamentos
join diagnostico d on d.id_diagnostico=f.id_diagnostico
join exames e on e.id_exames=f.id_exames
group by 1
order by 1 asc;

-- - Os pacientes de cada médico e suas especialidades - --
create or replace view vw_medico_paciente
as
select concat(m.primeiro_nome, ' ', m.ultimo_nome) as 'nome do médico',
e.descricao_especialidade,
concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome do paciente'
from medico m
join paciente p on p.id_medico=m.id_medico
join especialidade e on e.id_especialidade=m.id_especialidade
order by 1 asc;

-- - Pacientes que estão fazendo uso de antibiótico
create or replace view vw_pacientes_antibiotico
as
select concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome do paciente'
from paciente p
join ficha_do_paciente f on p.id_paciente = f.id_paciente
join medicamentos m on f.id_medicamentos = m.id_medicamentos
where m.descricao_medicamentos = 'antibiótico';

-- - Lista de diagnosticos mais recorrentes
create or replace view vw_diag_recorrentes
as
select d.descricao_diagnostico,
count(descricao_diagnostico) as 'Recorrências'
from diagnostico d
join ficha_do_paciente f on d.id_diagnostico=f.id_diagnostico
group by 1
order by 2 desc;

-- - Lista de exames mais solicitados

create or replace view vw_exames_solicitados
as
select e.descricao_exames,
count(descricao_exames) as 'Pedidos de exame'
from exames e
join ficha_do_paciente f on e.id_exames=f.id_exames
group by 1
order by 2 desc;

USE bancoprivado;

SELECT COUNT(conta_cliente.id) AS total_contas
FROM cliente
JOIN conta_cliente on cliente.id = conta_cliente.id_cliente
WHERE primeiro_nome LIKE '%Chris%';

DELIMITER //
CREATE FUNCTION contagem_contas (nome VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_contas INT;
    SELECT COUNT(conta_cliente.id) INTO total_contas
    FROM cliente
    JOIN conta_cliente ON cliente.id = conta_cliente.id_cliente
    WHERE cliente.primeiro_nome LIKE CONCAT('%', nome, '%');
    RETURN total_contas;
END;
// 
DELIMITER ;

SELECT contagem_contas('Chris') AS contas;

SELECT COALESCE(SUM(valor),0) AS saldo
FROM transacoes
WHERE id_conta_cliente = 1 AND tipo = 'Debito';
SELECT COALESCE(SUM(valor),0) AS fatura
FROM transacoes
WHERE id_conta_cliente = 1 AND tipo = 'Credito';


DELIMITER //
CREATE FUNCTION soma_saldo_fatura (id_conta_cliente INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE v_saldo FLOAT;
    DECLARE v_fatura FLOAT;
    SET v_saldo = COALESCE((SELECT SUM(valor) FROM transacoes WHERE transacoes.id_conta_cliente = id_conta_cliente AND tipo = 'Debito'), 0);
    SET v_fatura = COALESCE((SELECT SUM(valor) FROM transacoes WHERE transacoes.id_conta_cliente = id_conta_cliente AND tipo = 'Credito'), 0);
    RETURN CONCAT('Saldo: ', v_saldo, ' - Fatura: ', v_fatura);
END;
//
DELIMITER ; 

SELECT soma_saldo_fatura(1) AS saldo_e_fatura;

-- Active: 1696550627610@@localhost@3306@bancoprivado
USE bancoprivado;

SELECT * FROM transacoes;

DELIMITER //
CREATE PROCEDURE OrdernarTableTransacoes(IN coluna VARCHAR(20), IN tipo VARCHAR(20))
BEGIN
    IF coluna <> '' THEN
        IF tipo = 'Crescente' THEN
            SET @stringVar = CONCAT('ORDER BY ', coluna);
        ELSEIF tipo = 'Decrescente' THEN
            SET @stringVar = CONCAT('ORDER BY ',coluna,' DESC');
        ELSE
            -- aqui ele retorna uma msg de erro caso não seja nenhuma das duas opções --            
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tipo de ordenação não permitida';
        END IF;
    ELSE
        SET @stringVar = '';
    END IF;

    SET @RunSQLString = CONCAT('SELECT * FROM transacoes ', @stringVar);
    PREPARE RunSQL FROM @RunSQLString;
    EXECUTE RunSQL;
    DEALLOCATE PREPARE RunSQL;
END;
//
DELIMITER;

CALL OrdernarTableTransacoes('descricao','Crescente');


SELECT * FROM transacoes;

DELIMITER //
CREATE PROCEDURE AddDeleteLinhaTransacoes(IN demanda VARCHAR(20), IN id_clienteVar INT, IN id_conta_clienteVar INT, 
IN id_cartaoVar INT, IN valorVar FLOAT, IN tipoVar VARCHAR(255), IN descricaoVar VARCHAR(255), IN info_pagamentoVar VARCHAR(255), IN criterio INT)
BEGIN
    IF demanda = 'Adicionar' THEN
        SET @stringVar = CONCAT('INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento) VALUES (',
            id_clienteVar,',',id_conta_clienteVar,',',id_cartaoVar,',',valorVar,",'",tipoVar,"','",descricaoVar,"','",info_pagamentoVar,"');");
    ELSEIF demanda = 'Deletar' THEN
        IF criterio <> '' THEN
            SET @stringVar = CONCAT('DELETE FROM transacoes WHERE id',' = ',criterio);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Critério é obrigatório para a ação de "Deletar".';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de demanda não permitida';
    END IF;

    PREPARE RunSQL FROM @stringVar;
    EXECUTE RunSQL;
    DEALLOCATE PREPARE RunSQL;
END;
//
DELIMITER;


SELECT * FROM transacoes;
CALL AddDeleteLinhaTransacoes('Adicionar',1, 1, 1, 100.0, 'Credito', 'Compra de Eletrônicos', 'Americanas - São Paulo - SP',0);
CALL AddDeleteLinhaTransacoes('Deletar',0, 0, 0, 0, '', '', '',498);

USE bancoprivado;

-----------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER ATT SALDO E FATURA AUTOMATICO --
-----------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_credito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT SUM(valor) INTO valor_total FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Credito';

    UPDATE conta_cliente
    SET fatura_credito = valor_total
    WHERE id = NEW.id_conta_cliente;
END;
//
DELIMITER ;

-----------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER LOG TRANSACOES E TABELA --
-----------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER depois_de_inserir_transacao_debito
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT SUM(valor) INTO valor_total FROM transacoes
    WHERE id_conta_cliente = NEW.id_conta_cliente AND tipo = 'Debito';

    UPDATE conta_cliente
    SET saldo = -(valor_total)
    WHERE id = NEW.id_conta_cliente;
END;
//
DELIMITER ;

-----------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER LOG TRANSACOES E TABELA --
-----------------------------------------------------------------------------------------

CREATE TABLE log_transacoes (
codigo_update INT AUTO_INCREMENT PRIMARY KEY,
id_update INT NOT NULL,
usario_update VARCHAR(255) NOT NULL,
data_update VARCHAR(255) NOT NULL,
hora_update VARCHAR(255) NOT NULL
);

DELIMITER //
CREATE TRIGGER log_transacao
AFTER INSERT ON transacoes FOR EACH ROW
BEGIN
    INSERT INTO log_transacoes (id_update, usario_update, data_update, hora_update)
    VALUES (NEW.id, USER(), DATE(NEW.data_inclusao), TIME(NEW.data_inclusao));
END;
//
DELIMITER ;

-----------------------------------------------------------------------------------------
-- TESTES --
-----------------------------------------------------------------------------------------

SELECT * FROM transacoes;
SELECT * FROM log_transacoes;

INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES (1, 1, 1, 100.0, 'Credito', 'Compra de Eletrônicos', 'Americanas - São Paulo - SP');

SELECT * FROM transacoes;
SELECT * FROM log_transacoes;

-----------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER LOG CONTA_CLIENTE E TABELA --
-----------------------------------------------------------------------------------------

CREATE TABLE log_conta_cliente (
codigo_update INT AUTO_INCREMENT PRIMARY KEY,
id_update INT NOT NULL,
usario_update VARCHAR(255) NOT NULL,
data_update VARCHAR(255) NOT NULL,
hora_update VARCHAR(255) NOT NULL,
saldo_update_antigo FLOAT NOT NULL,
saldo_update_novo FLOAT NOT NULL,
fatura_credito_antigo FLOAT NOT NULL,
fatura_credito_novo FLOAT NOT NULL
);

DELIMITER //
CREATE TRIGGER log_conta_cliente
BEFORE UPDATE ON conta_cliente FOR EACH ROW
BEGIN
    INSERT INTO log_conta_cliente (id_update, usario_update, data_update, hora_update, saldo_update_antigo, saldo_update_novo, fatura_credito_antigo, fatura_credito_novo)
    VALUES (NEW.id, USER(), DATE(NEW.data_inclusao), TIME(NEW.data_inclusao), OLD.saldo, NEW.saldo, OLD.fatura_credito, NEW.fatura_credito);
END;
//
DELIMITER ;

-----------------------------------------------------------------------------------------
-- TESTES --
-----------------------------------------------------------------------------------------

SELECT * FROM conta_cliente;
SELECT * FROM log_conta_cliente;

INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES (1, 1, 1, 100.0, 'Credito', 'Compra de Eletrônicos', 'Americanas - São Paulo - SP');

SELECT * FROM conta_cliente;
SELECT * FROM log_conta_cliente;


