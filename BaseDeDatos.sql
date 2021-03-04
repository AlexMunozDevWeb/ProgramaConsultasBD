create database asirbd;

create table marcas
(
cifm int(4) not null, 
nombre char(10) not null,
ciudad char (15) not null,
PRIMARY KEY (cifm)
)Engine=InnoDB;

insert into marcas values ('0001','SEAT','Madrid');
insert into marcas values ('0002','Renault','Barcelona');
insert into marcas values ('0003','Citroen','Valencia');
insert into marcas values ('0004','Audi','Madrid');
insert into marcas values ('0005','Opel','Bilbao');
insert into marcas values ('0006','BMW','Barcelona');


create table coches
(
codcoche int(3) not null, 
nombre char(10) not null,
modelo char (10) not null,
PRIMARY KEY (codcoche)
)Engine=InnoDB;

insert into coches values ('001','Ibiza','Glx');
insert into coches values ('002','Ibiza','Gti');
insert into coches values ('003','Ibiza','Gtd');
insert into coches values ('004','Toledo','GTD');
insert into coches values ('005','Cordoba','Gti');
insert into coches values ('006','Megane','1.6');
insert into coches values ('007','Megane','Gti');
insert into coches values ('008','Laguna','Gtd');
insert into coches values ('009','Laguna','Td52');
insert into coches values ('010','Zx','16v');
insert into coches values ('011','Zx','Td');
insert into coches values ('012','Xantia','Gtd');
insert into coches values ('013','A4','1.8');
insert into coches values ('014','A4','2.8');
insert into coches values ('015','Astra','Caravan');
insert into coches values ('016','Astra','Gti');
insert into coches values ('017','Corsa','1.4');
insert into coches values ('018','300','316i');
insert into coches values ('019','500','525i');
insert into coches values ('020','700','750i');


create table clientes
(
dni int(4) not null,
nombre char(10) not null,
apellidos char(10) not null,
ciudad char(10) not null,
PRIMARY KEY (dni)
)Engine=InnDB;

insert into clientes values ('0001','Luis','Garcia','Madrid');
insert into clientes values ('0002','Antonio','Lopez','Valencia');
insert into clientes values ('0003','Juan','Martin','Madrid');
insert into clientes values ('0004','Maria','Garcia','Madrid');
insert into clientes values ('0005','Javier','gonzalez','Barcelona');
insert into clientes values ('0006','Ana','Lopez','Barcelona');

create table concesionario
(
cifc int(4) not null, 
nombre char(5) not null, 
ciudad char(10) not null,
PRIMARY KEY (cifc)
)Engine=InnDB;

insert into concesionario values ('0001','Acar','Madrid');
insert into concesionario values ('0002','Bcar','Madrid');
insert into concesionario values ('0003','Ccar','Barcelona');
insert into concesionario values ('0004','Dcar','Valencia');
insert into concesionario values ('0005','Ecar','Bilbao');

create table marco
(
cifm int(4) not null,
codcoche int(3) not null,
PRIMARY KEY (cifm,codcoche)
)Engine=InnDB;

insert into marco values ('001','001');
insert into marco values ('001','002');
insert into marco values ('001','003');
insert into marco values ('001','004');
insert into marco values ('001','005');
insert into marco values ('002','006');
insert into marco values ('002','007');
insert into marco values ('002','008');
insert into marco values ('002','009');
insert into marco values ('003','010');
insert into marco values ('003','011');
insert into marco values ('003','012');
insert into marco values ('004','013');
insert into marco values ('004','014');
insert into marco values ('005','015');
insert into marco values ('005','016');
insert into marco values ('005','017');
insert into marco values ('006','018');
insert into marco values ('006','019');
insert into marco values ('006','020');

create table distribucion
(
cifc int(4) not null,
codcoche int(3) not null,
cantidad int(2) not null,
PRIMARY KEY (cifc,codcoche)
)Engine=InnDB;

insert into distribucion values ('0001','001','3');
insert into distribucion values ('0001','005','7');
insert into distribucion values ('0001','006','7');
insert into distribucion values ('0002','006','5');
insert into distribucion values ('0002','008','10');
insert into distribucion values ('0002','009','10');
insert into distribucion values ('0003','010','5');
insert into distribucion values ('0003','011','3');
insert into distribucion values ('0003','012','5');
insert into distribucion values ('0004','013','10');
insert into distribucion values ('0004','014','5');
insert into distribucion values ('0005','015','10');
insert into distribucion values ('0005','016','20');
insert into distribucion values ('0005','016','8');
insert into distribucion values ('0006','017','3');

create table ventas
(
cifc int(4) not null,
dni int(4) not null,
codcoche int(3) not null,
color char(8) not null,
PRIMARY KEY (cifc,dni,codcoche)
)Engine=InnDB;

insert into ventas values ('0001','0001','001','Blanco');
insert into ventas values ('0001','0002','005','Rojo');
insert into ventas values ('0002','0003','008','Blanco');
insert into ventas values ('0002','0001','006','Rojo');
insert into ventas values ('0003','004','011','Rojo');
insert into ventas values ('0004','0005','014','Verde');


/* 8.- Añade en la tabla Marca un nuevo campo llamado Pais */
alter table marca add pais char (15);  

/* 9.- Obtener todos los campos de todos los concesionarios */
Select * from concesionario;

/*10.- Obtener todos los campos de todos los clientes de Madrid*/
Select * from clientes where ciudad=’madrid’;  

/*11.- Obtener los nombres de todas las Marcas  de coches ordenadas alfabéticamente.*/
Select nombre from marcas Order by nombre;

/*12.- Obtener el cifc de todos los concesionarios cuya cantidad en la tabla distribución es mayor que 18.*/
Select cifc from distribucion where cantidad>18;

/*13.- Obtener el cifc de todos los concesionarios cuya cantidad en la tabla distribución esta comprendida entre 10 y 18 ambos inclusive.*/
Select cifc from distribucion where cantidad  between 10 and 18; 

/*14.- Obtener el cifc de todos los concesionarios que han adquirido más de 10 coches o menos de 5 */
Select cifc from distribucion where cantidad >10 or cantidad<5;

/*15.- Obtener todas las parejas de cifm de marcas y dni clientes que sean de la misma ciudad */
Select cifm,dni from marcas,clientes where marcas.ciudad=clientes.ciudad;

/*16.- Obtener todas las parejas de dni  clientes y cifm de marcas que no sean de la misma ciudad. */
Select dni,cifm from clientes,marcas where clientes.ciudad!=marcas.ciudad; 

/*17.- Obtener los codcoches suministrados por algún concesionario de Barcelona */
Select codcoche 
from distribucion,concesionario 
where distribucion.cifc=concesionario.cifc
and concesionario.ciudad=’Barcelona’
order by codcoche;

/*18.- Obtener el codcoche de aquellos coches vendidos a clientes de Madrid */
Select codcoche
From ventas, clientes
Where ventas.codcoche=clientes.dni
And clientes.ciudad=’madrid’
Order by codcoche;

/* 19.- Obtener el codcoche de los coches que han sido adquiridos por un cliente de 
Madrid a un concesionario de Madrid. */
Select codcoche
From ventas,clientes,concesionario
Where concesionario.cifc=clientes.dni
And concesionario.ciudad=’madrid’ 
and clientes.ciudad=’madrid’
Order by codcoche;

/*20.- Obtener los codcoche de los coches comprados en un concesionario de distinta ciudad que el cliente que lo compra. */
select codcoche
from ventas,clientes,concesionario
where concesionario.ciudad!=clientes.ciudad
and concesionario.cifc=ventas.cifc
and clientes.dni=ventas.dni;

/*21.- Obtener todas las parejas de nombre de marcas que sean de la misma ciudad */
select a.nombre,b.nombre
from marcas as a, marcas as b
where  a.ciudad=b.ciudad and
a.nombre>b.nombre;

/*22.-Obtener las parejas de modelos de coches cuyo nombre es el mismo y cuya marca es de Bilbao */
select  a.modelo, b.modelo
from coches as a,coches as b, marco,marcas
where a.nombre=b.nombre
and a.modelo>b.modelo
and a.codcoche=marco.codcoche
and marco.cifm=marcas.cifm
and marcas.ciudad=’Bilbao’;

/*23.- Obtener todos los codcoche de los coches cuyo nombre empiece por C */
select codcoche
from coches
where nombre LIKE ‘C%’;

/*24 Obtener todos los codcoche de los coches cuyo nombre no contiene ninguna A */
Select Distinct codcoche
From coches
Where nombre not like ‘%a%’;

/* 25.- Obtener el número total de nombre de marcas de coches que son de madrid */
select count(distinct(nombre))
from marcas
where ciudad=’madrid’;


/*26 Obtener la media de la cantidad de coches que tienen todos los concesionarios */

Select avg(cantidad)
From distribucion;

/*27.- Obtener el dni con numeración más alta de todos los clientes de Madrid*/

select max(dni)
from clientes
where ciudad=’madrid’;

/*28.- Obtener el dni con numeración mas baja de todos los clients que han comprador un coche blanco.*/

select Min(dni)
from ventas
where color=’blanco’;

/*29.-Obtener el cifc de todos los concesionarios cuyo número de coches en stock no es nulo*/

select distinct cifc
from distribucion
where cantidad is not null;

/*30.- Obtener el cifm y el nombre de las marcas de coches cuya segunda letra del nombre de la ciudad de origen esa una I */
select distinct cifm, nombre
from marcas
where ciudad like ‘_i%’;

resultado: cifm 5 nombre Opel

/*31.- Obtener el dni de los clientes que han comprado algún coche de un concesionario de Madrid*/

select distinct dni
from ventas 
where cifc in (select cifc from concesionario where ciudad=’madrid’);

resultado= dni 1,2,3

/*32.- Obtener el color de los coches vendidos por el concesionario ACAR*/
Este ejercicio tienes dos formas de hacerlo:
	1.- select distinct color
	from ventas, concesionario
	where concesionario.nombre=’acar’
	and concesionario.cifc=ventas.cifc;
	
	2.- select distinct color
	from ventas
	where cifc in (select cifc from concesionario where nombre=’acar’);

	resultado= color = blanco,rojo
	
/*33.- Obtener el codcoche de los coches vendidos por algun concesionario de Madrid.*/
Select distinct codcoche
From ventas 
Where cifc in (select cifc from concesionario Where ciudad=’madrid’);

resultado codcoche = 1,5,6,8

/*34.- Obtener el codc de los coches vendidos por algún concesionario de Madrid*/
Select codcoche
from ventas
where cifc in (select cifc from concesionario where ciudad='madrid');

resultado = codcoche 1,5,6,8

/*35.- Obtener el nombre y el modelo de los coches vendidos por algún concesionario de Barcelona */
select nombre, modelo 
from coches,ventas 
where cifc in (select cifc 
		       from concesionario 
			   where ciudad='barcelona');

/*36.- Obtener todos los nombres de los clientes que hayan adquirido algún coche del concesionario DCAR */
select nombre 
from clientes 
where dni in (select cifc from concesionario where nombre='DCAR');

resultado nombre = maria

/*37.-Obtener el nombre y el apellido de los clientes que han adquirido un coche modelo GTI de color Blanco*/
select distinct cl.nombre, cl.apellidos
from ventas v,clientes cl, coches c
where c.codcoche=v.codcoche and cl.dni=v.dni
and v.color='Blanco'
and c.modelo='Gti' ;

resultado = esta vacio

38.- Obtener el nombre y el apellido de los clientes que han adquirido un automóvil a un concesionario que posea actualmente 
coches en stock del modelo GTI.
select distinct cl.nombre, cl.apellidos
from ventas v,clientes cl,coches c,concesionario co, distribucion d
where c.cod
coche=v.codcoche  and cl.dni=v.dni
and d.cifc=co.cifc
and c.modelo='Gti'
and d.cantidad>0;


/*39.- Obtener el nombre y el apellido de los clientes que han adquirido un automóvil a un concesionario
 de Madrid que posea actualmente coches en stock del modelo GTI*/
select distinct cl.nombre, cl.apellidos
from ventas v,clientes cl,coches c,concesionario co, distribucion d
where c.codcoche=v.codcoche and cl.dni=v.dni
and d.cifc=co.cifc
and c.modelo='Gti'
and d.cantidad>0
and co.ciudad='Madrid';
resultado = nombre Antonio, apellidos Lopez

/*40.-Obtener el nombre y el apellido de los clientes cuyo dni es menor que el del cliente Juan martin*/
select nombre,apellidos
from clientes
where dni<(
select dni
from clientes
where nombre='Juan' and apellidos='Martin');



/*41.- Obtener el nombre y el apellido de los clientes cuyo dni es menor que el de los clientes que son de Barcelona*/
SELECT nombre,apellidos
FROM clientes
WHERE dni <
ALL (SELECT dni FROM clientes WHERE ciudad='barcelona');

/*42.- Obtener el nombre y el apellido de los clientes cuyo nombre empiez por A y cuyo dni 
es mayor que el de los clientes que son de Madrid*/
select nombre,apellidos
from clientes
where dni> (
select max(dni)
from clientes
where ciudad='Madrid')
and nombre like ('A%');
resultado nombre ana, apellidos lopez

/*43.- Obtener el nombre y el apellido de los clientes cuyo nombre empieza por A y cuyo dni es mayor que el de Alguno */
de los clientes que son de Madrid
SELECT nombre,apellidos
FROM clientes
WHERE dni>

    ANY (SELECT dni
    FROM clientes
    WHERE ciudad='madrid')

AND nombre LIKE 'a%';

44.- Obtener el nombre y el apellido de los clientes cuyo nombre empieza por A y cuyo dni es mayor que 
el de Alguno de los clientes que son de Madrid o menor que el de todos los de valencia
select nombre,apellidos
from clientes
where dni> (
select min(dni)
from clientes
where ciudad='Madrid')
and nombre like ('A%') or dni<(select min(dni)
from clientes);

45.- Obtener el nombre y el apellido de los clientes que han comprado como minimo un coche blanco y un coche rojo

46.- Obtener el dni de los clientes cuya ciudad sea la ultima de la lista alfabetica de las ciudades donde hay concesionarios
select dni
from clientes
where ciudad=
(select max(ciudad)
from concesionario
order by ciudad);

47.- Obtener la media de los automóviles que cada concesionario tiene actualmente en stock
select c.nombre,avg(cantidad)
from distribucion d, concesionario c
where d.cifc=c.cifc
and cantidad>0
group by c.nombre;

48.- Obtener el cifc del concesionario que no sea de Madrid cuya media de vehiculos en stock sea la mas alta de todas las medias
select c.nombre,avg(cantidad)
from distribucion d, concesionario c
where d.cifc=c.cifc
and c.ciudad!='Madrid'
and cantidad>0
group by c.nombre
order by avg(cantidad);

/*49.- Repetir el ejercicio 34 pero utilizando EXITS en la solución*/
SELECT distinct va.dni
FROM ventas AS va
WHERE EXISTS
(SELECT * FROM ventas AS vb WHERE va.codcoche=vb.codcoche AND vb.cifc=1);

50.- Utilizando EXITS obtener el dni de los clientes que hayan adquirido por lo menos alguno de los coches que han sido vendidos por el concesionario cuyo cifc es 0001


51.- Obtener los dni de los clientes que sólo han comprado coches al concesionario 0001
select c.dni 
from clientes c, ventas v
where c.dni=v.dni
and v.cifc=0001;

52.- Obtener los nombres de los clientes que no han comprado ningún coche Rojo a ningún concesionario de Madrid
select c.nombre
from clientes c, ventas v,concesionario co
where c.dni=v.dni and v.cifc=co.cifc
and (v.color!='Rojo'and co.ciudad='Madrid');

53.- Obtener el nombre de los clientes que solo han comprado en el concesionario de cifc 0001
select c.nombre 
from clientes c, ventas v
where c.dni=v.dni
and v.cifc=0001;


54.- Obtener el codcoche de aquellos automóviles que han sido comprados por todos los clientes de Madrid

SELECT ventas.codcoche 
FROM ventas, clientes 
WHERE ventas.Dni = clientes.dni 
AND clientes.ciudad = "Madrid"


55.- Obtener el codcoche de aquellos automóviles de color rojo y de modelo GTI que han sido comprados por todos los clientes cuyo apellido comienza por G

SELECT ventas.Codcoche 
FROM ventas, clientes, coches 
WHERE ventas.Dni = clientes.dni 
AND ventas.color = "Rojo" AND clientes.apellidos 
LIKE "G%" 
AND ventas.Codcoche = coches.codcoche 
AND coches.modelo = "GTI"


56.- Obtener el dni de los clientes que han adquirido por lo menos los mismos automóviles que el cliente Luis Garcia

SELECT ventas.dni 
FROM ventas 
WHERE ventas.Codcoche = ANY ( SELECT ventas.codcoche 
FROM ventas, clientes 
WHERE ventas.Dni = clientes.dni 
AND clientes.nombre = "Luis" 
AND clientes.apellidos = "Garcia") 
AND ventas.dni NOT IN ( 
SELECT clientes.dni 
FROM clientes 
WHERE clientes.nombre = "Luis" 
AND clientes.apellidos = "Garcia")