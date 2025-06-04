-- 1.  Encuentra los nombres de los clientes y los detalles de sus pedidos.

SELECT u.nombre, dp.*
FROM usuarios AS u
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
WHERE u.tipo_id = 1;


