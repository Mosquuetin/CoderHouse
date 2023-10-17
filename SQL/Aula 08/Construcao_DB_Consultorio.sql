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
telefone INT NOT NULL,
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






