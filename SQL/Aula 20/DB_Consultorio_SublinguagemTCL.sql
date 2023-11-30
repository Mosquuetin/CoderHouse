
-- SUBLINGUAGEM TCL

-- Eliminar registros iniciando previamente uma transaçãoptimize

START TRANSACTION; /*iniciando a transação*/

DELETE FROM paciente 
WHERE id_paciente = 11; /*deletando da tabela paciente o paciente que tem o id 11*/

ROLLBACK; /*voltando ao estado anterior, ou seja, antes da exclusão*/

COMMIT; /*executando de forma definitiva o rollback*/


-- Inserir 8 novos registros

START TRANSACTION;

INSERT INTO paciente (primeiro_nome, ultimo_nome, cpf, cidade, bairro, rua, CEP, numero_casa, telefone, data_nascimento, id_medico)
VALUES ('Vivian', 'Silveira', 85633214574, 'São Paulo', 'Tatuapé', 'Av. Celso Garcia', 02661050, 46, 11912399658, '1992-07-19', 3),
('Paula', 'Gonçalves', 44125632501, 'São Paulo', 'Jardins', 'Rua Oscar Freire', 01426000, 156, 11963255401, '1978-11-02', 4),
('Rodrigo', 'Cunha', 84510625512, 'São Paulo', 'Moema', 'Av.Ibirapuera', 04029000, 1003, 11984559002, '1983-01-21', 2),
('Nilda', 'Oliveira', 45696321532, 'São Paulo', 'Vila Madalena', 'Rua Wisard', 05434030, 89, 11998564100, '1962-05-14', 1);
SAVEPOINT lote_1;
INSERT INTO paciente (primeiro_nome, ultimo_nome, cpf, cidade, bairro, rua, CEP, numero_casa, telefone, data_nascimento, id_medico)
VALUES ('José', 'Terto', 78456932501, 'São Paulo', 'Itaim Bibi', 'Av. Brigadeiro Faria Lima', 04538133, 101, 11956561402, '1985-09-30', 1),
('Matheus', 'Rodrigues', 32165495822, 'São Paulo', 'Vila Mariana', 'Rua Domingos de Morais', 04010000, 223, 11996581215, '1998-03-04', 3),
('Raul', 'Souza', 41102369503, 'São Paulo', 'Santo Amaro', 'Av. Adolfo Pinheiro', 04734000, 14, 11954612306, '1988-08-24', 4);
SAVEPOINT lote_2;