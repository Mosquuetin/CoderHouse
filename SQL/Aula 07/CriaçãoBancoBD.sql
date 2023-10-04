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

/*INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento)
VALUES ('1', '1', '1', 82.35, 'Debito', 'PAG LOJA 1', 'LOJA 1 - BH/MG');*/


/*
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
*/

/*
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
*/

