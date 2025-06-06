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

-- 3. Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos

SELECT 
  c.nombre AS nombre_cliente,
  e.nombre AS nombre_empleado
FROM pedidos AS p
INNER JOIN usuarios AS c ON p.cliente_id = c.usuario_id
INNER JOIN empleados AS emp ON p.empleado_id = emp.empleado_id
INNER JOIN usuarios AS e ON emp.usuario_id = e.usuario_id
GROUP BY c.nombre, e.nombre;

-- 4. Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`


SELECT 
    productos.nombre AS Producto,
    pedidos.cliente_id AS Cliente_id,
    cliente.nombre AS Cliente_Nombre,
    pedidos.empleado_id AS Empleado_id,
    empleado.nombre AS Empleado_Nombre,
    detalles_pedidos.cantidad AS Cantidad,
    pedidos.fecha_pedido AS Fecha,
    pedidos.estado AS Estado
FROM pedidos
LEFT JOIN detalles_pedidos
    ON pedidos.pedido_id = detalles_pedidos.pedido_id
LEFT JOIN productos
    ON detalles_pedidos.producto_id = productos.producto_id
INNER JOIN usuarios AS cliente
    ON pedidos.cliente_id = cliente.usuario_id
INNER JOIN empleados
    ON pedidos.empleado_id = empleados.empleado_id
INNER JOIN usuarios AS empleado
    ON empleados.usuario_id = empleado.usuario_id;

-- 5. Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.


SELECT
    productos.producto_id,
    productos.nombre AS Nombre_producto,
    productos.precio AS Precio_producto,
    detalles_pedidos.cantidad AS Cantidad_pedido,
    detalles_pedidos.detalle_id AS DetallePedido_id
FROM detalles_pedidos
RIGHT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

--6.  Lista todos los empleados junto con los pedidos que han gestionado, 
-- si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.

SELECT 
    empleados.empleado_id,
    empleado.nombre AS Empleado_Nombre,
    pedidos.pedido_id,
    productos.nombre AS Producto_Nombre,
    pedidos.fecha_pedido,
    pedidos.estado
FROM empleados
LEFT JOIN pedidos
    ON empleados.empleado_id = pedidos.empleado_id
LEFT JOIN detalles_pedidos
    ON pedidos.pedido_id = detalles_pedidos.pedido_id
LEFT JOIN productos
    ON detalles_pedidos.producto_id = productos.producto_id
INNER JOIN usuarios AS empleado
    ON empleados.usuario_id = empleado.usuario_id
ORDER BY empleados.empleado_id;


-- 7. Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.

SELECT    
    empleados.empleado_id,
    empleados.puesto AS Cargo,
    empleados.fecha_contratacion AS FechaContratacion,
    empleados.salario AS Salario
FROM empleados
LEFT JOIN pedidos
    ON empleados.empleado_id = pedidos.empleado_id
WHERE pedidos.pedido_id IS NULL;

-- confirmacion que los empleados  tubieran pedidos, por si acaso XD

SELECT empleados.empleado_id, pedidos.pedido_id
FROM empleados
RIGHT JOIN pedidos ON empleados.empleado_id = pedidos.empleado_id;

-- 8. Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.

SELECT 
    pedidos.pedido_id AS PedidoID,
    pedidos.fecha_pedido AS FechaPedido,
    SUM(detalles_pedidos.precio_unitario * detalles_pedidos.cantidad) AS TotalGastado
FROM pedidos
JOIN detalles_pedidos
ON pedidos.pedido_id = detalles_pedidos.pedido_id
GROUP BY pedidos.pedido_id, pedidos.fecha_pedido;

-- 9. Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.


SELECT *
FROM usuarios
CROSS JOIN productos;

-- 10. Encuentra los nombres de los clientes y los productos que han comprado,
-- si existen, incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`.

SELECT
    usuarios.usuario_id AS idUsuarios,
    usuarios.nombre AS Nombre_usuario,
    pedidos.estado AS Estado_del_pedido
FROM usuarios
LEFT JOIN pedidos
ON usuarios.usuario_id = pedidos.cliente_id;

-- 11. Listar todos los proveedores que suministran un determinado producto.

SELECT
    proveedores.proveedor_id AS idPROVEEDOR,
    proveedores.nombre AS Proveedor,
    productos.nombre AS Producto,
    productos.categoria AS Categoria,
    productos.precio AS Precio
FROM proveedores
JOIN proveedores_productos
    ON proveedores.proveedor_id = proveedores_productos.proveedor_id
JOIN productos
    ON proveedores_productos.producto_id = productos.producto_id
WHERE productos.nombre = 'Ratón';



-- 12. Obtener todos los productos que ofrece un proveedor específico.
SELECT
    proveedores.proveedor_id AS idPROVEEDOR,
    proveedores.nombre AS Proveedor,
    productos.nombre AS Producto,
    productos.categoria AS Categoria,
    productos.precio AS Precio
FROM proveedores
JOIN proveedores_productos
    ON proveedores.proveedor_id = proveedores_productos.proveedor_id
JOIN productos
    ON proveedores_productos.producto_id = productos.producto_id
WHERE proveedores.nombre = 'Accesorios y Más S.A.S.'; 

