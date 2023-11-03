
USE coderhouse;

SELECT * FROM current_class;

INSERT INTO current_class (sql_class_id, current_class_id,date)
VALUES
    (45775, 5, '2023-09-26');

TRUNCATE TABLE current_class;

USE ecommerce;

DROP FUNCTION somar;
DELIMITER //
CREATE FUNCTION somar (parametro1 INT, parametro2 INT)
RETURNS INT
NO SQL
BEGIN
    DECLARE resultado INT;
    SET resultado = (parametro1 + parametro2);
    RETURN resultado;
END;
// 
DELIMITER ;

SELECT somar(2,3) AS valor_somado;

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


