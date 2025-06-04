-- 1.  Encuentra los nombres de los clientes y los detalles de sus pedidos.

SELECT u.nombre, dp.*
FROM usuarios AS u
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
WHERE u.tipo_id = 1;


-- 2. Lista todos los productos pedidos junto con el precio unitario de cada pedido

SELECT p.pedido_id, GROUP_CONCAT(CONCAT(po.nombre,  ',',po.categoria)) AS productos, SUM(dp.cantidad * dp.precio_unitario) as Total
FROM pedidos AS p
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos AS po ON dp.producto_id = po.producto_id
GROUP BY p.pedido_id;

