-- ------------------------------------------------------
-- ------------------------------------------------------
-- Povoamento inicial da base de dados
-- ------------------------------------------------------
-- ------------------------------------------------------
--
-- Esquema: Hotel 

USE hotel;

-- Povoamento da tabela localCliente
INSERT INTO localCliente
		(idLocalCliente, pais, cidade)
        VALUES
        (1, 'Portugal', 'Porto'),
        (2, 'Espanha', 'Madrid'),
        (3, 'França', 'Paris'),
        (4, 'Bélgica', 'Bruxelas'),
        (5, 'Holanda', 'Amesterdao'),
        (6, 'Itália', 'Roma'), 
        (7, 'Portugal', 'Braga'),
        (8, 'Alemanha', 'Berlim'),
        (9, 'Reino Unido', 'Londres'),
        (10, 'Portugal', 'Coimbra'),
        (11, 'Reino Unido', 'Manchester'),
        (12, 'Portugal', 'Viseu'),
        (13, 'Portugal', 'Viana do Castelo'),
		(14, 'Portugal', 'Vila Nova De Gaia'),
        (15, 'Áustria', 'Viena'),
        (16, 'Portugal', 'Évora'),
        (17, 'Portugal', 'Lisboa'),
        (18, 'Portugal', 'Aveiro'), 
        (19, 'Espanha', 'Barcelona'),
        (20, 'Portugal', 'Bragança'),
        (21, 'Suiça', 'Zurique'),
        (22, 'Portugal', 'Vila Real'),
        (23, 'Portugal', 'Setúbal');
            
-- Povoamento da tabela Cliente
INSERT INTO cliente
		(idCliente, nome, email, contacto, profissao, idLocalCliente)
        VALUES
        (1, 'Vítor Campos', 'vitoPT@gmail.com', 921231234, 'Economista', 1),
        (2, 'Penelope Cruz', 'penelope_cruz@yahoo.com', 79007635, 'Gestora', 2), 
        (3, 'Catherine Laurent', 'catherine123@gmail.com', 54912558, 'Designer', 3),
        (4, 'Sarah Wagner', 'wagner.Sarah@yandex.com', 255-727-3402, 'Esteticista', 4),
		(5, 'Leonor Castro', 'lele53@hotmail.com', 960121564, 'Engenheira de Sistemas', 7),
		(6, 'Thomas Johnson', 'TJohnson28@mail.com', 36600992, 'Barbeiro', 5),
        (7, 'Bruno Silva', 'bruninho_03@sapo.pt', 9334560, 'Engenheiro Mecânico', 10),
        (8, 'Diane Brown', 'diane_B@xfinity.com', 77517208, 'Enfermeira', 6),
        (9, 'Carolina Marques', 'carol_M@hotmail.com', 914587890, 'Secretária', 12),
        (10, 'Michael Smith', 'Michael.S@aol.com', 61579673, 'Músico', 8),
        (11, 'Duarte Machado', 'lady_killer@hotmail.com', 919123472, 'Carpinteiro', 13),
        (12, 'Angie Jones', 'blondie_angie@sapo.pt', 919823112, 'Optometrista', 9),
		(13, 'Susana Oliveira', 'suzy_21@sapo.pt', 9304562, 'Cabeleireira', 11),
        (14, 'Joel Costa', 'jo_costa@hotmail.com', 9677823, 'Agricultor', 14),
        (15, 'Mary Daniels', 'mary_D@comcast.net', 35614970, 'Cozinheira', 15),
        (16, 'Paul Hayes', 'Paul.Hayes@yandex.com', 26189731, 'Jornalista', 19),
        (17, 'Daniel Sintra', 'dany_sintra@hotmail.com', 921527448, 'Sapateiro', 16),
        (18, 'Olga Mendes', 'olguinha1977@gmail.com', 915003412, 'Engenheira fisica', 1),
        (19, 'Cátia Almeida', 'katinha@sapo.pt', 921327668, 'lojista', 18),
        (20, 'Joanna Cooper', 'Joanna.Cooper@mail.com', 37512376, 'Professora', 21),
        (21, 'Tiago Castro', 'tiago_champ_1904@live.com.pt', 9100123, 'Engenheiro e Gestor Industrial', 20),
        (22, 'Rafael Silva', 'rafinha1997@hotmail.com',  925652349, 'Gestora', 17),
        (23, 'Rui Peixoto', 'peixe1996@hotmail.com', 967811523, 'Engenheiro quimico', 22),
        (24, 'Erika Gonzalez', 'Erika_G@zoho.com', 838960730, 'Enfermeira', 19),
        (25, 'Zulmira Campos', 'zinha_06@gmail.com', 967843223, 'Veterinária', 18),
        (26, 'Inês Machado', 'maria03@hotmail.com',  919191919, 'Dentista', 23);
        
-- Povoamento da tabela tipoEstadia 
INSERT INTO tipoEstadia
		(idTipoEstadia, descricao)
        VALUES
        (1, 'lazer'),
        (2, 'negócio'),
        (3, 'passagem');

-- Povoamento da tabela Quarto
INSERT INTO quarto
		(idQuarto, descricao, preco)
        VALUES
        (1, 'quarto individual', 30.00),
        (2, 'quarto duplo', 55.00),
        (3, 'quarto triplo', 65.00),
        (4, 'quarto suite', 80.00);
  
-- Povoamento da tabela Servico
INSERT INTO servico
		(idServico, descricao, preco)
        VALUES
        (1, 'pequeno-almoco', 10.00),
        (2, 'jantar', 35.00),
        (3, 'pequeno-almoço e jantar', 50.00),
        (4, 'pequeno-almoço no quarto', 15.00),
        (5, 'acesso sauna', 20.00),
		(6, 'acesso jacuzzi', 25.00),
        (7, 'acesso ginasio', 15.00),
        (8, 'acesso piscina interior', 15.00); 
                
-- Povoamento da tabela reserva
INSERT INTO reserva
		(idReserva, dataReserva, dataCheckIn, dataCheckOut, totalDeNoites, nrAdultos, nrBebes, nrCriancas, valorTotal, idCliente, idTipoEstadia)
        VALUES
        (1, '2016-04-03', '2016-04-15', '2015-04-17', 2, 2, 0, 0, 160.00, 3, 1), -- cliente3 
        (2, '2016-01-05', '2016-08-06', '2015-08-12', 6, 2, 1, 1, 970.00, 7, 1), -- cliente7 
        (3, '2016-01-31', '2016-02-06', '2016-02-07', 1, 2, 0, 0, 65.00, 5, 1), -- cliente5 
        (4, '2016-01-20', '2016-06-11', '2015-06-16', 4, 2, 0, 1, 410.00, 18, 1), -- cliente18 
        (5, '2016-04-17', '2016-04-18', '2016-04-19', 1, 1, 0, 0, 40.00, 6, 3), -- cliente6 
        (6, '2016-01-01', '2016-01-01', '2016-01-03', 2, 2, 0, 0, 135.00, 2, 1), -- cliente2 
        (7, '2016-05-01', '2016-05-10', '2016-05-11', 1, 2, 0, 0, 155.00, 16, 2), -- cliente16 
        (8, '2016-06-11', '2016-09-09', '2016-09-11', 2, 2, 1, 0, 240.00, 8, 1), -- cliente8 
        (9, '2016-02-08', '2016-04-21', '2016-04-24', 3, 2, 0, 2, 290.00, 4, 1), -- cliente4 
        (10, '2016-05-12', '2016-05-23', '2016-05-24', 1, 1, 0, 0, 40.00, 9, 3), -- cliente9 
        (11, '2016-06-05', '2016-10-12', '2016-10-17', 4, 2, 0, 0, 220.00, 1, 1), -- cliente1 
        (12, '2016-05-18', '2016-07-16', '2016-07-17', 1, 2, 0, 0, 85.00, 11, 1), -- cliente11 
		(13, '2016-09-10', '2016-10-04', '2016-10-05', 1, 1, 0, 0, 40.00, 10, 2), -- cliente10 
        (14, '2016-03-17', '2016-03-19', '2016-03-20', 1, 2, 0, 0, 65.00, 12, 3), -- cliente12
        (15, '2016-11-13', '2016-11-15', '2016-11-17', 2, 1, 0, 0, 85.00, 13, 2), -- cliente13 
		(16, '2016-04-28', '2016-05-06', '2016-05-08', 2, 2, 0, 1, 210.00, 14, 1), -- cliente14 
		(17, '2016-12-01', '2016-12-13', '2016-12-14', 1, 1, 0, 0, 55.00, 15, 2), -- cliente15 
		(18, '2016-11-18', '2016-11-21', '2016-11-22', 1, 4, 0, 0, 165.00, 17, 2), -- cliente17 
		(19, '2016-04-09', '2016-06-11', '2016-06-13', 2, 4, 0, 1, 430.00, 19, 2), -- cliente19 
		(20, '2016-01-26', '2016-08-15', '2016-08-20', 4, 2, 1, 1, 355.00, 20, 1), -- cliente20 
        (21, '2016-02-17', '2016-02-18', '2016-02-19', 1, 2, 0, 0, 65.00, 21, 3), -- cliente21 
        (22, '2016-05-30', '2016-07-15', '2016-07-17', 2, 2, 0, 1, 210.00, 22, 1), -- cliente22 
		(23, '2016-06-02', '2016-08-25', '2016-08-30', 4, 2, 1, 0, 395.00, 23, 1),-- cliente23 
        (24, '2016-04-22', '2016-07-14', '2016-07-19', 5, 4, 0, 0, 615.00, 24, 1), -- cliente24 
        (25, '2016-09-15', '2016-09-21', '2016-09-22', 1, 1, 0, 0, 64.00, 25, 2), -- cliente25 
        (26, '2016-04-11', '2016-06-24', '2016-06-26', 2, 2, 0, 0, 160.00, 26, 1), -- cliente26 
		(27, '2016-09-01', '2016-09-07', '2016-09-08', 1, 1, 0, 0, 40.00, 16, 2), -- cliente16 -- repetir no mesmo ano
		(28, '2016-05-30', '2016-07-25', '2016-07-29', 4, 2, 0, 0, 295.00, 2, 1), -- cliente2 -- repetido no mesmo ano
        (29, '2016-05-27', '2016-08-08', '2016-08-11', 3, 2, 0, 0, 205.00, 12, 1), -- cliente12 -- repetido no mesmo ano
		(30, '2016-10-15', '2016-10-17', '2016-10-18', 1, 1, 0, 0, 80.00, 11, 2), -- cliente11 - repetido no mesmo ano
		(31, '2017-03-15', '2017-07-13', '2017-07-17', 3, 4, 0, 1, 395.00, 22, 1), -- cliente22 --repetir clientes ano seguinte
        (32, '2017-04-02', '2017-04-07', '2017-04-09', 2, 2, 0, 1, 180.00, 16, 1), -- cliente 16 -- no passado tinha ido em trabalho, agora vem a lazer
        (33, '2017-02-19', '2017-03-06', '2017-03-05', 1, 2, 0, 0, 70.00, 7, 2), -- cliente7 -- no passado tinha ido em lazer, agora vem de negocios
		(34, '2017-04-21', '2017-07-20', '2017-07-25', 4, 2, 1, 1, 410.00, 20, 1), -- cliente 20 -- veio de novo passar férias
        (35,'2017-11-08', '2017-11-13', '2017-11-14', 1, 1, 0, 0, 65.00, 12, 3), -- cliente12
		(36, '2017-06-01', '2017-06-27', '2017-06-30', 3, 2, 1, 0, 220.00, 23, 1), -- cliente23 
        (37, '2017-06-01', '2017-08-15', '2017-08-18', 3, 2, 0, 1, 270.00, 14, 1), -- cliente 14
        (38, '2017-03-20', '2017-07-14', '2017-07-16', 2, 4, 0, 0, 255.00, 3, 1), -- cliente3
        (39, '2017-04-01', '2017-04-21', '2017-04-23', 2, 2, 0, 0, 180.00, 5, 1), -- cliente5
        (40, '2017-04-16', '2017-08-29', '2017-08-31', 2, 2, 1, 0, 155.00, 8, 1), -- cliente8
        (41, '2017-12-01', '2017-12-09', '2017-12-10', 1, 2, 0, 0, 125.00, 21, 1), -- cliente21
		(42, '2017-03-19', '2017-03-20', '2017-03-21', 1, 1, 0, 0, 40.00, 17, 2), -- cliente17
        (43, '2017-04-11', '2017-05-26', '2017-05-28', 2, 2, 0, 0, 85.00, 7, 2), -- cliente7 - 2x no mesmo ano, uma em negocios e outro em lazer
		(44, '2017-05-15', '2017-06-19', '2017-06-22', 3, 2, 0, 0, 220.00, 5, 1), -- cliente5, 2x no mesmo ano
		(45, '2017-06-11', '2017-08-18', '2017-08-22', 4, 2, 0, 1, 295.00, 16, 1); -- cliente16

-- Povoamento da tabela ponte reservaQuarto
INSERT INTO ReservaQuarto
		(idReserva, idQuarto, valor, quantidade)
		VALUES
        (1, 2, 55.00, 1),
		(2, 4, 80.00, 1),
        (3, 2, 55.00, 1),
		(4, 3, 65.00, 1),
		(5, 1, 30.00, 1),
        (6, 2, 55.00, 1),
        (7, 1, 30.00, 2),
		(8, 4, 80.00, 1),
        (9, 4, 80.00, 1),
		(10, 1, 30.00, 1),
		(11, 2, 55.00, 1),
		(12, 2, 55.00, 1),
        (13, 1, 30.00, 1),
        (14, 2, 55.00, 1),
		(15, 1, 30.00, 1),
        (16, 4, 80.00, 1), 
		(17, 1, 30.00, 1),
        (18, 2, 55.00, 2),
        (19, 1, 55.00, 1),
        (19, 3, 65.00, 1),
        (20, 4, 80.00, 1),
        (21, 2, 55.00, 1),
        (22, 3, 65.00, 1),
		(23, 4, 80.00, 1),
        (24, 2, 55.00, 2), 
        (25, 1, 30.00, 1),
        (26, 2, 55.00, 1),
        (27, 1, 30.00, 1), 
        (28, 2, 55.00, 1),
        (29, 2, 55.00, 1),
        (30, 1, 30.00, 1),
        (31, 3, 65.00, 1),
        (31, 2, 55.00, 1),
        (32, 3, 65.00, 1), 
		(33, 1, 30.00, 2),
        (34, 4, 80.00, 1),
        (35, 1, 30.00, 1),
        (36, 3, 65.00, 1),
		(37, 3, 65.00, 1),
        (38, 2, 55.00, 2),
        (39, 2, 55.00, 1),
        (40, 3, 65.00, 1),
		(41, 2, 55.00, 1), 
        (42, 1, 30.00, 1),
        (43, 2, 55.00, 1),
		(44, 2, 55.00, 1),
        (45, 4, 80.00, 1);
            
-- Povoamento da tabela ponte reservaServico
INSERT INTO ReservaServico
		(idReserva, idServico, valor)
        VALUES
        (1, 3, 50.00),
        (2, 3, 50.00),
        (2, 6, 25.00),
        (2, 5, 20.00),
        (2, 8, 15.00),
        (3, 1, 10.00),
        (4, 3, 50.00),
        (5, 1, 10.00),
        (6, 1, 10.00),
        (6, 8, 15.00),
        (7, 3, 55.00),
        (8, 3, 55.00),
        (8, 6, 25.00),
        (9, 1, 10.00),
        (9, 5, 20.00),
		(9, 6, 25.00),
		(9, 8, 15.00),
        (10, 1, 10.00),
        (11, 3, 50.00),
        (11, 6, 25.00),
        (11, 8, 15.00),
        (12, 4, 15.00),
		(12, 8, 15.00),
		(13, 1, 10.00),
        (14, 1, 10.00),
        (15, 3, 55.00),
		(16, 1, 10.00),
        (16, 6, 25.00),
		(16, 8, 15.00),
        (17, 1, 10.00),
		(17, 7, 15.00),
		(18, 2, 35.00), 
        (18, 5, 20.00),
        (19, 3, 50.00),
        (19, 6, 25.00),
        (19, 8, 15.00),
        (20, 1, 10.00),
        (20, 6, 25.00),
        (21, 1, 10.00),
        (22, 3, 55.00),
        (22, 6, 25.00),
        (23, 3, 50.00),
        (23, 6, 25.00), 
		(24, 1, 10.00),
        (24, 4, 15.00),
        (24, 6, 25.00),
        (24, 7, 15.00), 
        (25, 2, 35.00), 
        (26, 1, 10.00),
        (26, 6, 25.00),
        (26, 7, 15.00),
        (27, 3, 50.00),
		(27, 1, 10.00),
        (28, 3, 50.00),
        (28, 6, 25.00),
        (29, 1, 10.00),
        (29, 6, 25.00),
        (29, 7, 15.00),
        (30, 3, 50.00),
        (31, 1, 10.00),
        (31, 6, 25.00),
        (32, 1, 10.00),
        (32, 6, 25.00),
        (32, 8, 15.00),
        (33, 1, 10.00), 
        (34, 3, 50.00),
        (34, 6, 25.00),
        (34, 8, 15.00),
        (35, 1, 35.00),
        (36, 1, 10.00), 
        (36, 8, 15.00),
        (37, 3, 50.00),
        (37, 6, 25.00),
        (38, 1, 10.00),
        (38, 6, 25.00),
        (39, 3, 50.00),
        (39, 5, 20.00),
		(40, 1, 10.00),
        (40, 8, 15.00),
        (41, 3, 50.00),
        (41, 5, 20.00),
        (42, 1, 10.00),
        (43, 1, 10.00),
		(43, 5, 20.00),
        (44, 1, 10.00), 
        (44, 5, 20.00),
		(44, 6, 25.00),
        (45, 3, 50.00),
        (45, 6, 25.00);