SELECT p.id AS pedido_id, p.created_at, c.first_name, c.last_name
FROM pedidos p
INNER JOIN clientes c ON p.client_id = c.id;

SELECT e.id AS entrega_id, e.updated_at, concat(en.address,' - ',en.state) AS endereco_entrega
FROM entregas e
INNER JOIN enderecos en ON e.address_id = en.id;

SELECT p.id AS pedido_id, p.created_at, pr.name AS produto, pr.price
FROM pedidos p
INNER JOIN itens_pedido ip ON p.id = ip.transaction_id
LEFT JOIN produtos pr ON ip.product_id = pr.id;
