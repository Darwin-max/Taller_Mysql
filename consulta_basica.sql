 --1.Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.

SELECT * FROM usuarios WHERE tipo_id = 1;


--2. Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.

SELECT nombre, email 
FROM usuarios 
WHERE tipo_id = 1  AND ciudad = 'Madrid';

--3. Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.

SELECT * FROM productos;

SELECT nombre, precio FROM productos WHERE precio > 100000;

--4. Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.

SELECT * FROM empleados;

SELECT usuarios.nombre, empleados.salario, empleados.puesto
FROM usuarios
JOIN empleados ON usuarios.usuario_id = empleados.usuario_id
WHERE empleados.salario > 2500000;
--5. Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.

SELECT nombre , categoria FROM productos
WHERE categoria = 'Electrónica' 
ORDER BY categoria ASC;

-- 6.Muestra los detalles de los pedidos que están en estado "Pendiente",
-- incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.

SELECT * FROM detalles_pedidos;
SELECT * FROM pedidos;

SELECT pedidos.cliente_id, pedidos.pedido_id, pedidos.fecha_pedido,
pedidos.estado
FROM pedidos
WHERE estado  = 'Pendiente';

-- 7. Encuentra el nombre y el precio del producto más caro en la base de datos.

SELECT nombre, precio FROM productos
WHERE precio =( SELECT MAX(precio) FROM productos);

-- 8. Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente_id;

-- 9. Calcula el promedio de salario de todos los empleados en la empresa.

SELECT AVG(salario) FROM empleados;

-- 10. Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos.

SELECT categoria, COUNT(*) FROM productos GROUP BY categoria;

-- 11. Obtén una lista de productos con un precio mayor a $75 USD, 
-- mostrando solo el nombre, el precio y su respectivo precio en USD.
SELECT nombre, precio, (precio / 4000) AS precio_usd
FROM productos
WHERE (precio / 4000) > 75;
-- 12. Lista todos los proveedores registrados.

SELECT * FROM proveedores