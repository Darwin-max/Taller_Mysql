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
