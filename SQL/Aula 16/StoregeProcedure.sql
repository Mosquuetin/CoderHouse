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




