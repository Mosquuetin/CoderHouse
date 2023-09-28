USE coderhouse;
SELECT st.first_name AS primeiro_nome, st.last_name AS ultimo_nome, sr.description AS profissao
FROM students AS st
LEFT JOIN student_roles AS sr ON st.profession_id=sr.id
WHERE sr.description LIKE '%Analista%';