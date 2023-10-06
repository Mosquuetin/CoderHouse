CREATE DATABASE bank

USE bank;

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE conta(
    id_conta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    saldo FLOAT DEFAULT 0.0,
    id_cluster INT NOT NULL
);

CREATE TABLE cluster_conta(
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao INT NOT NULL,
    id_valor_credito INT NOT NULL
);

CREATE TABLE credito_especial(
    id_credito INT AUTO_INCREMENT PRIMARY KEY,
    valor FLOAT DEFAULT 0.0
);

CREATE TABLE transacoes(
    id_transacao INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_transacao INT NOT NULL,
    id_conta INT NOT NULL,
    valor FLOAT DEFAULT 0.0
);

CREATE TABLE tipo_transacao(
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255)
);

ALTER TABLE conta
ADD CONSTRAINT fk_cliente_conta
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE conta
ADD CONSTRAINT fk_cliente_cluster_contas
FOREIGN KEY (id_cluster) REFERENCES cluster_conta(id);

ALTER TABLE cluster_conta
ADD CONSTRAINT fk_cluster_contas_credito_especial
FOREIGN KEY (id_valor_credito) REFERENCES credito_especial(id_credito);

ALTER TABLE transacoes
ADD CONSTRAINT fk_historico_transacoes_conta
FOREIGN KEY (id_conta) REFERENCES conta(id_conta);

ALTER TABLE transacoes
ADD CONSTRAINT fk_historico_transacoes_tipo_transacao
FOREIGN KEY (id_tipo_transacao) REFERENCES tipo_transacao(id);



