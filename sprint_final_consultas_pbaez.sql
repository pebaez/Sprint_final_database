use sprint_final_individual_pbaez;

select * from encuesta;


/*******************************************************************************************************************************************************
Tu aplicación necesita una base de datos para sistematizar el funcionamiento del soporte ‘En qué puedo ayudarte’. El soporte lo realizan operarios.

¿Cada vez que un usuario utiliza el soporte ‘’En qué puedo ayudarte?’ se le asigna un operario para ayudarlo con su problema. 
Luego de esto, el usuario responde una encuesta donde califica al operario con una nota de 1 a 7, 
junto a un pequeño comentario sobre su atención. 
Queremos sistematizar esta información en una base de datos. Cada usuario tiene información sobre: nombre, apellido, edad, correo electrónico y número de veces que ha utilizado la aplicación 
(por defecto es 1, pero al insertar los registros debe indicar un número manual). 
Cada operario tiene información sobre: nombre, apellido, edad, correo electrónico y número de veces que ha servido de soporte (por defecto es 1, pero al insertar los registros debe indicar un número manual). 
Cada vez que se realiza un soporte, se reconoce quien es el operario, el cliente, la fecha y la evaluación que recibe el soporte. 
Diagrame el modelo entidad relación. Construya una base de datos. 
Asigne un usuario con todos los privilegios. 
Construya las tablas. Agregue 5 usuarios, 5 operadores y 10 operaciones de soporte. 
Los datos debe crearlos según su imaginación. 

/******************************************************************************************************


/********************************** CONSULTAS ********************************************************************/

 -- Seleccione las 3 operaciones con mejor evaluación. 
  
 SELECT * FROM encuesta;
 
 SELECT * from soporte;
 
 SELECT  * 
 FROM 	soporte as S, encuesta as E
 WHERE 	S.encuesta_idencuesta = E.idencuesta
 ORDER 	by E.calificacion DESC
 limit 	0,3;
 
 
 
 -- Seleccione las 3 operaciones con menos evaluación. 
 
 SELECT  * 
 FROM 	soporte as S, encuesta as E
 WHERE 	S.encuesta_idencuesta = E.idencuesta
 ORDER 	by E.calificacion ASC
 limit 	0,3;
 
  -- Seleccione al operario que más soportes ha realizado. 
  
  -- ** Nota el problema planteaba ingresar una columna con n_realizado_soporte en la tabla operarios, siendo que la consulta es 
  -- con el calculo de la cantidad de veces que se repite un operario en la tabla soporte (veces de atenciones). 
  

 -- Consulta correcta  
SELECT  COUNT(S.operario_idoperario) as Cuenta_de_Atenciones, O.*
FROM 	soporte as S, operario as O
WHERE 	S.operario_idoperario = O.idoperario
GROUP BY S.operario_idoperario 
ORDER BY Cuenta_de_Atenciones DESC
LIMIT 0,1;

-- Consulta solicitada 
select *
from operario
where n_realizado_soporte = ( select max(n_realizado_soporte) from operario );


 -- Seleccione al cliente que menos veces ha utilizado la aplicación.

 -- ** Nota el problema planteaba ingresar una columna con n_utilizado_soporte en la tabl asuarios operarios, siendo que la consulta es 
  -- con el calculo de la cantidad de veces que se repite un usuario en la tabla soporte (veces de ingresos). 
 
SELECT  COUNT(S.usuario_idusuario) as Cuenta_de_Solicitudes_de_Soporte, U.*
FROM 	soporte as S, usuario as U
WHERE 	S.usuario_idusuario = U.idusuario
GROUP BY S.usuario_idusuario 
ORDER BY Cuenta_de_Solicitudes_de_Soporte ASC
LIMIT 0,1;


-- Consulta solicitada 
select *
from usuario
where n_utilizado_soporte = ( select max(n_utilizado_soporte) from usuario );
 
 
 -- Agregue 10 años a los tres primeros usuarios registrados. 
 
 select * from usuario;
 
 update usuario
 set edad = edad + 10 
 where idusuario <=3;
 
 select * from usuario;
 
  -- Renombre todas las columnas ‘correo electrónico’.  El nuevo nombre debe ser email. 
  
ALTER TABLE usuario CHANGE COLUMN `correo_electronico` `email` VARCHAR(45) NULL DEFAULT NULL ;
  
  -- Seleccione solo los operarios mayores de 20 años.

SELECT operario.* from operario where edad >= 20;
