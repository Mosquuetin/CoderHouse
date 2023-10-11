USE coderhouse;

CREATE OR REPLACE VIEW data_roles_view
AS
SELECT description FROM data_roles;

SELECT * FROM data_roles_view

USE ecommerce

CREATE OR REPLACE VIEW status_pedido_view
AS
SELECT CONCAT(c.first_name,' ',c.last_name) AS cliente, sp.name AS status_pedido 
FROM pedidos AS p
JOIN clientes AS c ON c.id=p.client_id
JOIN status_pedido AS sp ON p.status_id=sp.id;

SELECT * FROM status_pedido_view;

CREATE OR REPLACE VIEW idade_clientes_view
AS
SELECT CONCAT(c.first_name,' ',c.last_name) AS nome_completo, c.birthdate as data_nascimento,
TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS idade
FROM clientes AS c;

SELECT * FROM idade_clientes_view;

CREATE OR REPLACE VIEW valor_vendas_caterogia_view
AS
SELECT p.name AS nome_produto, ROUND(SUM(price),2) AS valor_vendas
FROM produtos AS p
JOIN itens_pedido AS ip ON p.id=ip.product_id
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM valor_vendas_caterogia_view;
DROP VIEW valor_vendas_caterogia_view;

USE library;

CREATE OR REPLACE VIEW generos_livros_view
AS
SELECT genre, count(*) AS qtd_livros
FROM library
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM generos_livros_view;

USE ecommerce

CREATE OR REPLACE VIEW pedidos_full
AS
SELECT p.id AS id_pedido, p.created_at AS data_criacao, sp.name AS status_pedido, 
CONCAT(c.first_name,' ',c.last_name) AS nome_completo,
pr.name AS produto, pr.price AS preco_produto, pr.category AS categoria_produto
FROM pedidos AS p
JOIN status_pedido AS sp ON p.status_id=sp.id
JOIN clientes AS c ON p.client_id=c.id
JOIN itens_pedido AS ip ON p.id=ip.transaction_id
JOIN produtos AS pr ON ip.product_id=pr.id

SELECT CAST(data_criacao AS date), COUNT(DISTINCT id_pedido)
FROM pedidos_full
GROUP BY 1;

CREATE OR REPLACE VIEW pedido_data_nome_view
AS
SELECT p.id AS id_pedido, p.created_at AS data_criacao, CONCAT(c.first_name,' ',c.last_name) AS nome_completo 
FROM pedidos AS p
JOIN clientes AS c ON c.id=p.client_id;

SELECT * FROM pedido_data_nome_view; 

CREATE OR REPLACE VIEW entrega_atualizacao_endereco_view
AS
SELECT e.id AS id_entrega, e.updated_at AS ultima_atualização, CONCAT(en.address,' ',en.state) AS endereco
FROM entregas AS e
JOIN enderecos AS en ON en.id=e.address_id; 

SELECT * FROM entrega_atualizacao_endereco_view; 

CREATE OR REPLACE VIEW pedido_cricaco_produto
AS
SELECT p.id AS id_pedido, p.created_at AS data_criacao, pr.name AS produto
FROM pedidos AS p
JOIN itens_pedido AS ip ON ip.transaction_id=p.id
JOIN produtos AS pr ON pr.id=ip.product_id;

SELECT * FROM pedido_cricaco_produto; 
