-- Criação de usuários
USE mysql;

-- Usuário com permissão apenas para leitura de todas as tabelas --
CREATE USER 'usuario1'@'localhost' /*criando o usuário definindo o nome e domínio ao qual pertence*/
IDENTIFIED BY 'senha123'; /*definindo a senha do usuario1*/

GRANT SELECT ON consultorio.* TO 'usuario1'@'localhost'; /*concedendo permissão de leitura ao usuario1 a todas 
as tabelas do banco de dados do consultorio*/

SHOW GRANTS FOR 'usuario1'@'localhost'; /*para visualizar as permissões do usuario1*/


-- Usuário com permissão para leitura, inserção e modificações de dados --
CREATE USER 'usuario2'@'localhost' /*criando o usuário definindo o nome e domínio ao qual pertence*/
IDENTIFIED BY '123senha'; /*definindo a senha do usuario2*/

GRANT SELECT, INSERT, UPDATE ON consultorio.* TO 'usuario2'@'localhost'; /*concedendo permissão de leitura, 
inserção e modificação de dados de todas as tabelas do banco de dados do consultorio*/

SHOW GRANTS FOR 'usuario2'@'localhost'; /*para visualizar as permissões do usuario2*/