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
