-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
	clientes(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)
INSERT INTO
	pedidos(status, cliente_id)
VALUES
	('Recebido', (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia'));

-- 3)
INSERT INTO
	produtos_pedidos(pedido_id, produto_id)
VALUES
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura

-- 1)
SELECT clientes.*,
	   pedidos.*,
	   produtos.*
FROM produtos_pedidos
JOIN produtos ON produtos_pedidos.produto_id = produtos.id
JOIN pedidos  ON produtos_pedidos.pedido_id  = pedidos.id
JOIN clientes ON produtos_pedidos.pedido_id  = clientes.id
WHERE clientes.id = 6;

-- Atualização

-- 1)
UPDATE
	clientes
SET lealdade = 46
WHERE clientes.id = 6;

-- Deleção

-- 1)
DELETE FROM clientes WHERE clientes.id = 4;


