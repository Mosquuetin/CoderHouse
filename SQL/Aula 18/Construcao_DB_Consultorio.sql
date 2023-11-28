CREATE DATABASE consultorio;

USE consultorio;


CREATE TABLE turno (
id_turno INT AUTO_INCREMENT PRIMARY KEY,
descricao_turno TEXT(255) NOT NULL
);

CREATE TABLE especialidade (
id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
descricao_especialidade TEXT(255) NOT NULL
);

CREATE TABLE medico (
id_medico INT AUTO_INCREMENT PRIMARY KEY,
primeiro_nome TEXT(255) NOT NULL,
ultimo_nome TEXT(255) NOT NULL,
id_especialidade INT NOT NULL,
crm_medico VARCHAR(255) NOT NULL,
id_turno INT NOT NULL
);

CREATE TABLE paciente (
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
primeiro_nome TEXT(255) NOT NULL,
ultimo_nome TEXT(255) NOT NULL,
cpf VARCHAR(255) NOT NULL,
cidade TEXT(255) NOT NULL,
bairro VARCHAR(255) NOT NULL,
rua VARCHAR(255) NOT NULL,
CEP VARCHAR(255) NOT NULL,
numero_casa VARCHAR(255) NOT NULL,
telefone VARCHAR(15) NOT NULL,
data_nascimento DATE NOT NULL,
id_medico INT NOT NULL
);


CREATE TABLE diagnostico (
id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
descricao_diagnostico TEXT(255) NOT NULL
);

CREATE TABLE medicamentos (
id_medicamentos INT AUTO_INCREMENT PRIMARY KEY,
descricao_medicamentos TEXT(255) NOT NULL
);

CREATE TABLE exames (
id_exames INT AUTO_INCREMENT PRIMARY KEY,
descricao_exames TEXT(255) NOT NULL
);

CREATE TABLE ficha_do_paciente (
id_ficha INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
id_diagnostico INT NOT NULL,
id_medicamentos INT NOT NULL,
id_exames INT
);

ALTER TABLE ficha_do_paciente
ADD CONSTRAINT fk_ficha_paciente
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
ON UPDATE CASCADE
ON DELETE RESTRICT;


ALTER TABLE ficha_do_paciente
ADD CONSTRAINT fk_ficha_diagnostico
FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT fk_ficha_medicamentos
FOREIGN KEY (id_medicamentos) REFERENCES medicamentos (id_medicamentos)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT fk_ficha_exames
FOREIGN KEY (id_exames) REFERENCES exames (id_exames)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE paciente
ADD CONSTRAINT fk_paciente_medico
FOREIGN KEY (id_medico) REFERENCES medico (id_medico)
ON UPDATE CASCADE
ON DELETE CASCADE;


ALTER TABLE medico
ADD CONSTRAINT fk_medico_especialidade
FOREIGN KEY (id_especialidade) REFERENCES especialidade (id_especialidade)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
ADD CONSTRAINT fk_medico_turno
FOREIGN KEY (id_turno) REFERENCES turno (id_turno)
ON UPDATE CASCADE
ON DELETE CASCADE;



-- - SOBRE ON UPDATE E ON DELETE

-- - Turno pode ser alterado em cascata, pois o turno pode ser excluído ou atualizado e precisará ir para a tabela de médico.

-- - Paciente pode ser atualizado em cascata, pois pode ser que ele mude de endereço, de telefone, etc, mas deletar precisa de atenção.

-- - Diagnostico, medicamento, exame e médico não podem ser deletados e nem atualizados, já que faz parte do histórico do paciente.

-- - Especialidade não pode ser deletado e nem alterado visto que faz parte do histórico do médico e, consequentemente, do paciente. Mesmo que o médico mude de especialidade em algum momento, as outras tabelas precisam estar com a especilidade original.



-- - Script de inserção de dados

INSERT INTO turno(descricao_turno)
VALUES ('Manhã'),
('Tarde');

INSERT INTO especialidade (descricao_especialidade)
VALUES ('Clínica Geral'),
('Otorrinolaringologia'),
('Neurologia'),
('Cardiologia');

INSERT INTO medico (primeiro_nome, ultimo_nome, id_especialidade, crm_medico, id_turno)
VALUES ('Vanessa',	'Rodrigues',	1, 'CRM-SP 90123', 1),
('Rogério',	'Dutra', 1, 'CRM-SP 34567', 2),
('Gustavo',	'Vargas', 2, 'CRM-SP 67891', 1),
('Juliana',	'Gomes', 2, 'CRM-MG 54321', 2),
('Vitor', 'Andrade', 3, 'CRM-SP 12345', 2),
('Patrícia', 'Almeida', 4,	'CRM-RJ 23456', 1);



INSERT INTO paciente (primeiro_nome, ultimo_nome, cpf, cidade, bairro, rua, CEP, numero_casa, telefone, data_nascimento, id_medico)
VALUES ('João', 'Silva', 12345678910, 'São Paulo', 'Pinheiros', 'Rua dos Pinheiros', 5422000, 456, 11912345678, '1985-04-15', 2),
('Sofia', 'Almeida', 89012345689, 'São Paulo', 'Higienópolis', 'Rua Bahia', 1244000, 678, 11321098765, '1993-03-12', 3),
('Pedro', 'Oliveira', 45678901230, 'São Paulo', 'Vila Mariana', 'Rua Vergueiro', 4101000, 321, 11876543210, '1978-12-03', 4),
('Isabela', 'Ribeiro', 1234567891, 'São Paulo', 'Vila Madalena', 'Rua Aspicuelta', 5433011, 234, 11109876543, '1997-10-22', 1),
('Carlos', 'Ferreira', 34567890156, 'São Paulo', 'Jardins', 'Alameda Santos', 1419001, 567, 11654321098, '1964-02-20', 3),
('Maria', 'Santos',	98765432100, 'São Paulo', 'Moema', 'Alameda dos Anapurus', 4087000,	789, 11987654321, '1990-08-25', 4),
('Lucas', 'Costa', 90123456790, 'São Paulo', 'Itaim Bibi', 'Rua Joaquim Floriano',	4534010, 901, 11210987654, '1954-10-30', 6),
('Laura', 'Lima', 67890123467, 'São Paulo',	'Bela Vista', 'Rua Treze de Maio',	1327000, 890, 11543210987, '1989-09-05', 5),
('Gabriel', 'Rodrigues', 78901234578, 'São Paulo', 'Consolação', 'Rua da Consolação', 1301000,	345, 11432109876, '1987-07-18', 2),
('Ana', 'Pereira', 23456789045,	'São Paulo', 'Perdizes', 'Rua Cardoso de Almeida', 5013001,	234, 11765432109, '1975-06-10', 2);


INSERT INTO diagnostico (descricao_diagnostico)
VALUES ('Anemia Ferropriva'),
('Infecção de ouvido'),
('Pneumonia Bacteriana'),
('Desvio de Septo'),
('Diabetes Mellitus Tipo 2'),
('Enxaqueca Crônica'),
('Gravidez Confirmada'),
('Insuficiência Cardíaca Congestiva'),
('Pólipo Nasal');


INSERT INTO medicamentos (descricao_medicamentos)
VALUES ('Ácido Fólico'),
('Antibiótico'),
('Descongestionante Nasal'),
('Metformina'),
('Analgésico'),
('Inibidor da ECA');

INSERT INTO exames (descricao_exames)
VALUES ('Hemograma Completo'),
('Otoscopia'),
('Radiografia de Tórax'),
('Endoscopia Nasal'),
('Glicemia em Jejum'),
('Ressonância Magnética Cerebral'),
('Beta-hCG'),
('Ecocardiograma'),
('Nasofibrolaringoscopia');

INSERT INTO ficha_do_paciente (id_paciente, id_diagnostico, id_medicamentos, id_exames)
VALUES (9, 1, 1, 1),
(2, 2, 2, 2),
(6, 2, 2, 2),
(1, 3, 2, 3),
(3, 4, 3, 4),
(10, 5, 4, 5),
(8, 6, 5, 6),
(4, 7, 1, 7),
(7, 8, 6, 8),
(5, 9, 3, 9);


-- - Criação de views

-- - Quantidade de pacientes por turno - -- 
/*Essa view tem como objetivo contar quantos pacientes a clínica terá em cada turno*/
/*É composta pelas tabelas medico, paciente e turno*/
create or replace view vw_pacientes_por_turno
as
select m.id_turno, 
t.descricao_turno,
count(p.id_paciente) as 'Total paciente por turno'
from medico m 
join paciente p on p.id_medico=m.id_medico 
join turno t on t.id_turno=m.id_turno
group by 1;

-- - Detalhes da ficha médica do paciente - --
/*Essa view tem como objetivo puxar todas as informações dos pacientes para que se tenha uma visão única*/
/*É composta pelas tabelas ficha_do_paciente, paciente, medicamentos, diagnosticos e exames*/
create or replace view vw_ficha_medica
as
select f.id_ficha as 'número da ficha', 
concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome completo',
p.data_nascimento,
m.descricao_medicamentos as 'nome do medicamento',
d.descricao_diagnostico as 'diagnóstico', 
e.descricao_exames as exames
from ficha_do_paciente f
join paciente p on p.id_paciente=f.id_paciente
join medicamentos m on m.id_medicamentos=f.id_medicamentos
join diagnostico d on d.id_diagnostico=f.id_diagnostico
join exames e on e.id_exames=f.id_exames
group by 1
order by 1 asc;

-- - Os pacientes de cada médico e suas especialidades - --
/*Essa view tem como objetivo verificar quantos pacientes tem cada médico por especialidade*/
/*É composta pelas medico, paciente e especialidade*/
create or replace view vw_medico_paciente
as
select concat(m.primeiro_nome, ' ', m.ultimo_nome) as 'nome do médico',
e.descricao_especialidade,
concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome do paciente'
from medico m
join paciente p on p.id_medico=m.id_medico
join especialidade e on e.id_especialidade=m.id_especialidade
order by 1 asc;

-- - Pacientes que estão fazendo uso de antibiótico
/*Essa view tem como objetivo mostrar todos os pacientes que fazem uso de antibiótico*/
/*É composta pelas tabelas ficha_do_paciente, medicamentos e paciente*/
create or replace view vw_pacientes_antibiotico
as
select concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome do paciente'
from paciente p
join ficha_do_paciente f on p.id_paciente = f.id_paciente
join medicamentos m on f.id_medicamentos = m.id_medicamentos
where m.descricao_medicamentos = 'antibiótico';

-- - Lista de diagnosticos mais recorrentes
/*Essa view tem como objetivo verificar quais são os diagnosticos mais recorrentes entre os pacientes da clínica*/
/*É composta pelas tabelas diganostico e ficha_do_paciente*/
create or replace view vw_diag_recorrentes
as
select d.descricao_diagnostico,
count(descricao_diagnostico) as 'Recorrências'
from diagnostico d
join ficha_do_paciente f on d.id_diagnostico=f.id_diagnostico
group by 1
order by 2 desc;

-- - Lista de exames mais solicitados
/*Essa view tem como objetivo verificar quais são os exames mais recorrentes da clínica*/
/*É composta pelas tabelas exames e ficha_do_paciente*/
create or replace view vw_exames_solicitados
as
select e.descricao_exames,
count(descricao_exames) as 'Pedidos de exame'
from exames e
join ficha_do_paciente f on e.id_exames=f.id_exames
group by 1
order by 2 desc;



-- - Script de criação de funções
 
-- - Cálculo da idade dos pacientes - -- 
DELIMITER //
CREATE FUNCTION fn_idade_paciente(data_nascimento DATE) 
RETURNS INT
NO SQL
BEGIN
    DECLARE idade INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idade;
    RETURN idade;
END;
//
DELIMITER ;

SELECT concat(primeiro_nome, ' ', ultimo_nome) as paciente, fn_idade_paciente(data_nascimento) as idade 
FROM paciente;


-- - Contar número de pacientes por médico - -- 

DELIMITER //
CREATE FUNCTION PacientePorMedico(medico INT) 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE numPacientes INT;
    SELECT COUNT(*) INTO numPacientes
    FROM paciente
    WHERE id_medico = medico;
    RETURN numPacientes;
END;
//
DELIMITER ;

select PacientePorMedico(), primeiro_nome
from medico;
--------------------------------------------------------------------------


-- SCRIPT DE CRIAÇÃO DE STORED PROCEDURES

/*essa procedure tem como objetivo puxar os dados da tabela paciente de forma ordenada pelo parametro*/
delimiter //
CREATE PROCEDURE PacientesOrdenar (IN parametro1 VARCHAR(50), IN parametro2 BOOL)
BEGIN
  IF parametro1 <> '' THEN
		IF parametro2  THEN 
			SET @ordenar = concat('ORDER BY ', parametro1,' DESC');
		ELSE
			SET @ordenar = concat('ORDER BY ', parametro1);
		END IF;
  ELSE
    SET @game_order = '';
  END IF;

  SET @clausula = concat('SELECT * FROM paciente ', @ordenar);
  PREPARE runSQL FROM @clausula;
  EXECUTE runSQL;
  DEALLOCATE PREPARE runSQL;
END;

// 
delimiter ;

call PacientesOrdenar('primeiro_nome', false); 


/*essa procedure tem como objetivo inserir um novo paciente na tabela paciente*/
DELIMITER //
CREATE PROCEDURE RegistrarNovoPaciente(
IN primeiro_nome TEXT(255),
IN ultimo_nome TEXT(255),
IN cpf VARCHAR(255),
IN cidade TEXT(255),
IN bairro VARCHAR(255),
IN rua VARCHAR(255),
IN CEP VARCHAR(255),
IN numero_casa VARCHAR(255),
IN telefone VARCHAR(15),
IN data_nascimento DATE,
IN id_medico INT)
  
BEGIN
    INSERT INTO paciente (primeiro_nome, ultimo_nome, cpf, cidade, bairro, rua, CEP, numero_casa, telefone, data_nascimento, id_medico)
    VALUES (primeiro_nome, ultimo_nome, cpf, cidade, bairro, rua, CEP, numero_casa, telefone, data_nascimento, id_medico);
END;
//
DELIMITER ;

CALL RegistrarNovoPaciente('Márcio','Duarte','85624165302','São Paulo', 'Pinheiros', 'Rua dos Pinheiros', '25661-050', '22', '963251221','1984-10-31', '3');
select * from paciente where primeiro_nome='Márcio';

--------------------------------------------------------------------------

-- -CRIAÇÃO DE TRIGGERS

-- Verifica se o exame já foi solicitado ao paciente

DELIMITER //

CREATE TRIGGER verificar_exame_existente
BEFORE INSERT ON ficha_do_paciente
FOR EACH ROW
BEGIN
    DECLARE exame_existente INT;
    -- contando a quantidade de exames existem com esse id
    SELECT COUNT(*) INTO exame_existente FROM ficha_do_paciente WHERE id_exames = NEW.id_exames;
    -- se existir algum exame com esse numero....
    IF exame_existente > 0 THEN
	-- retorne erro, pois exame ja solicitado
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exame já solicitado';
    END IF;
END;

//

DELIMITER ;


-- Armazenar a mudança de médico do paciente na tabela medico_paciente_update

CREATE TABLE medico_paciente_update (
codigo_update INT AUTO_INCREMENT PRIMARY KEY,
medico_anterior VARCHAR (100),
medico_atual VARCHAR (100),
id_paciente INT,
primeiro_nome TEXT(255) NOT NULL,
ultimo_nome TEXT(255) NOT NULL
);


DELIMITER //

CREATE TRIGGER tg_update_medico
AFTER UPDATE ON paciente
FOR EACH ROW
BEGIN
   INSERT INTO medico_paciente_update(medico_anterior, medico_atual, id_paciente, primeiro_nome, ultimo_nome)
   VALUES (OLD.id_medico, NEW.id_medico, OLD.id_paciente, OLD.primeiro_nome, OLD.ultimo_nome);
      END;
   
   //

DELIMITER ;




