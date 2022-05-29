--
-- ---------- PASSAR DA AREA DE RETENCAO PARA O Data Warehouse ----------
-- ----------------------  LOAD ------------
-- ------

use dw_hotel_reservas;

-- queries para colocar no pentaho
-- colocar no input pentaho e correr no pentaho
-- depois verificar aqui se resultou

-- POVOAR A DIM data (ou seja, mandar da AR calendario para a dim_data)
SELECT idData, diaSemana, diaData, mesData, mesAno, anoData, data
FROM ar_calendario;

-- verificar 
SELECT * FROM dim_data;

-- POVOAR A DIM CALENDARIO 
-- passar da AR hotel para a dim_hotel
SELECT idHotel, nome, localidade FROM ar_hotel;

-- verificar
SELECT * FROM dim_hotel;

-- POVOAR A DIM CLIENTE
-- passar da AR LIMPEZA CLIENTE para DIM_CLIENTE
SELECT nif, nome, cidade, pais, tipoEstadia, nrbebes, nrCriancas, nrAdultos, valid_from, valid_to, sk_cliente 
FROM AR_Limpeza_Cliente
WHERE sk_cliente !=0;

-- verificar
SELECT * FROM dim_cliente;

SELECT * FROM dim_cliente
WHERE NIF = 40;


-- POVOAR A TF_RESERVAS
-- passar da AR RESERVAS EXCEL para a TF_RESERVAS
-- esta query junta a tabela limpeza cliente com a reserva da AR.
-- vai buscar a info da tabela limpeza cliente q está válida entre o valid_from e o valid_to.
-- a geraçao de chaves novas é o proprio id reserva na TF que faz, pois está como Auto Increment. 
SELECT idReserva, valor, nrNoites, CAST(date_format(dataCheckin, '%Y%m%d') AS unsigned) AS dim_iddata, res.nif AS dim_nif, sk_cliente AS dim_sk_cliente, idHotel AS dim_idhotel
FROM ar_reserva_excel res
LEFT JOIN ar_limpeza_cliente cli ON res.nif = cli.nif
AND res.datacheckin >= cli.valid_from AND res.datacheckin < cli.valid_to
order by idReserva;

-- passar da AR RESERVAS MYSQL para a TF_RESERVAS
SELECT idReserva, valor, nrNoites, CAST(date_format(dataCheckin, '%Y%m%d') AS unsigned) AS dim_iddata, res.nif AS dim_nif, sk_cliente AS dim_sk_cliente, idHotel AS dim_idhotel
FROM ar_reserva_mysql AS res
LEFT JOIN ar_limpeza_cliente AS cli ON res.nif = cli.nif
AND res.datacheckin >= cli.valid_from AND res.datacheckin < cli.valid_to
order by idReserva;

-- verificar
SELECT * from tf_reservas;

-- ------------