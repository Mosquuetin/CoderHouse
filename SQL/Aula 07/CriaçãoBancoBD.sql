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






