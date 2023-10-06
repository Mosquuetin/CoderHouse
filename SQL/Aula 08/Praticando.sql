/*create database mercadinho; 
use mercadinho;

-- Tabela de Categorias de Produtos
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nome_categoria VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);


-- Tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Inserção de dados na tabela de Categorias de Produtos
INSERT INTO categorias (categoria_id, nome_categoria)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Roupas'),
    (3, 'Livros'),
    (4, 'Alimentos');


-- Inserção de dados na tabela de Produtos
INSERT INTO produtos (produto_id, nome_produto, preco, categoria_id)
VALUES
    (1, 'Produto A', 19.99, 1), -- Produto A pertence à categoria 1
    (2, 'Produto B', 29.99, 2), -- Produto B pertence à categoria 2
    (3, 'Produto C', 9.99, 1),  -- Produto C pertence à categoria 1
    (4, 'Produto D', 39.99, 3); -- Produto D pertence à categoria 3



-- Inserção de dados na tabela de Clientes
INSERT INTO clientes (cliente_id, nome_cliente, email)
VALUES
    (1, 'João Silva', 'joao@email.com'),
    (2, 'Maria Santos', 'maria@email.com'),
    (3, 'Carlos Mendes', 'carlos@email.com'),
    (4, 'Ana Ferreira', 'ana@email.com');

-- Inserção de dados na tabela de Pedidos
INSERT INTO pedidos (pedido_id, cliente_id, data_pedido, total)
VALUES
    (1, 1, '2023-01-15', 49.98),
    (2, 2, '2023-01-16', 79.97),
    (3, 3, '2023-01-17', 19.98),
    (4, 4, '2023-01-18', 59.97);*/
    
    
USE mercadinho;

SELECT * FROM pedidos as pd
LEFT JOIN clientes AS cl ON pd.cliente_id = cl.cliente_id
WHERE nome_cliente = 'João Silva'





