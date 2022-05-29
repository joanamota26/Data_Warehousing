use hotel;
-- ------------------------------------------------
-- ------ EXTRAÇAO PARA A AREA DE RETENÇAO --------
-- ------------------------- ----

-- QUERIES PARA METER NO PENTAHO
-- tabelas na AR:
-- uma tabela para cada fonte

-- AR CLIENTE MYSQL
-- AR CLIENTE EXCEL
-- AR RESERVA MYSQL 
-- AR RESERVA EXCEL
-- AR HOTEL
-- AR CALENDARIO

-- extraçao para AR CLIENTE MYSQL
SELECT cliente.nif, cliente.nome, localcliente.cidade, localCliente.pais, reserva.nrbebes, reserva.nrcriancas, reserva.nradultos, tipoestadia.descricao, reserva.datacheckin 
FROM cliente
INNER JOIN reserva on cliente.nif = reserva.nif
INNER JOIN localCliente on cliente.idLocalCliente = localCliente.idLocalCliente
INNER JOIN tipoEstadia on reserva.idtipoestadia = tipoEstadia.idTipoEstadia; 

-- verificar
SELECT * FROM ar_cliente_mysql;


-- extraçao para AR CLIENTE EXCEL - é so selecionar as colunas no pentaho
-- verificar 
SELECT * FROM ar_cliente_excel;


-- extraçao para AR RESERVA MYSQL
SELECT 1 AS idHotel, 
idReserva, nif, 
valorTotal AS valor ,
totalDeNoites AS nrNoites,
datacheckIn 
FROM reserva;

-- verificar 
SELECT * FROM ar_reserva_Mysql;

-- extraçao para AR RESERVA EXCEL - é so selecionar as colunas no pentaho
-- verificar
SELECT * FROM ar_reserva_excel;


-- CRIAÇAO DA AR HOTEL (nao é extraçao pq nao tem nas fontes)
-- colocar no pentaho para mandar para AR Hotel
select 1 as idhotel, 'hotel city' AS nome, 
'Lisboa' AS localidade from dual 
UNION
SELECT 2 AS idhotel, 'resort hotel' AS nome,
'Algarve' AS localidade from dual;

-- verificar 
SELECT * FROM ar_hotel;

-- assim tem de funcionar estas tabelas:

-- AR CLIENTE
SELECT * FROM ar_cliente_mysql;
SELECT * FROM ar_cliente_excel; 

-- AR RESERVA
SELECT * FROM ar_reserva_mysql;
SELECT * FROM ar_reserva_excel;

-- CALENDÁRIO E HOTEL
SELECT * FROM ar_calendario;
SELECT * FROM ar_hotel;

-- --------------
