-- - Criação de views

-- - Quantidade de pacientes por turno - -- 
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
create or replace view vw_pacientes_antibiotico
as
select concat(p.primeiro_nome, ' ', p.ultimo_nome) as 'nome do paciente'
from paciente p
join ficha_do_paciente f on p.id_paciente = f.id_paciente
join medicamentos m on f.id_medicamentos = m.id_medicamentos
where m.descricao_medicamentos = 'antibiótico';

-- - Lista de diagnosticos mais recorrentes
create or replace view vw_diag_recorrentes
as
select d.descricao_diagnostico,
count(descricao_diagnostico) as 'Recorrências'
from diagnostico d
join ficha_do_paciente f on d.id_diagnostico=f.id_diagnostico
group by 1
order by 2 desc;

-- - Lista de exames mais solicitados

create or replace view vw_exames_solicitados
as
select e.descricao_exames,
count(descricao_exames) as 'Pedidos de exame'
from exames e
join ficha_do_paciente f on e.id_exames=f.id_exames
group by 1
order by 2 desc;
