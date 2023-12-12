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

-----------------------------------------------------------------------------------------