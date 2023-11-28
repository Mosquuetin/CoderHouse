-- Active: 1696550627610@@localhost@3306@bancoprivado
-- Criação de usuários
USE bancoprivado;

-- Usuário com permissão apenas para leitura de todas as tabelas --
CREATE USER 'usuario1'@'localhost'
IDENTIFIED BY 'senha123'; 

-- concedendo permissão de leitura de todas as tabelas --
GRANT SELECT ON bancoprivado.* TO 'usuario1'@'localhost'; 
SHOW GRANTS FOR 'usuario1'@'localhost'; 


-- Usuário com permissão para leitura, inserção e modificação --
CREATE USER 'usuario2'@'localhost' 
IDENTIFIED BY '123senha'; 

-- concedendo permissão de leitura, inserção e modificação --
GRANT SELECT, INSERT, UPDATE ON bancoprivado.* TO 'usuario2'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost'; 

-- Teste Revoke --
REVOKE ALL, GRANT OPTION FROM 'usuario1'@'localhost';