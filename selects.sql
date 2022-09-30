-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1) 
SELECT pedidos.id,
	   pedidos.status,
	   pedidos.cliente_id,
	   produtos.*
FROM produtos_pedidos
JOIN produtos
ON produtos_pedidos.produto_id = produtos.id
JOIN pedidos
ON produtos_pedidos.pedido_id = pedidos.id
ORDER BY pedidos.id;

-- 2)
SELECT produtos_pedidos.pedido_id 
FROM produtos_pedidos
WHERE produtos_pedidos.produto_id = 6;

-- 3)
SELECT clientes.nome AS gostam_de_fritas
FROM clientes
WHERE clientes.nome = 'Paula' OR clientes.nome = 'Elise' OR clientes.nome = 'Marcelo';

-- 4)
SELECT SUM(CAST(produtos.preço AS decimal(10,2)))
FROM produtos_pedidos
JOIN produtos
ON produtos_pedidos.produto_id  = produtos.id 
WHERE produtos_pedidos.pedido_id  = 5;

-- 5)
SELECT produtos.nome,
	   COUNT(produtos_pedidos.pedido_id)
FROM produtos_pedidos
JOIN produtos
ON produtos_pedidos.produto_id = produtos.id
GROUP BY produtos.nome;
