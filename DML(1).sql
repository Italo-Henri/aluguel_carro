use aluguel_carro;

/*Inserindo Valores às tabelas*/

/*Tabela Perfil de Usuário*/
INSERT INTO `perfil_user` (idperfil, nome_perfil, data_criacao) 
VALUES (1,'administrador','2022-01-01'), (2,'vendedor','2022-01-01');

/*Tabela Tipos de Veículos*/
INSERT INTO `tipo_veiculo` (idtipo_veiculo, nome_tipo_veiculo)
VALUES (1,'Ultilitário'),(2,'Passeio');

/*Tabela de Usuários*/
INSERT INTO `user` (iduser, nome_user, idperfil)
VALUES (1, 'Marcelo Vinicius Santos', 2),(2,'Julio Brito Caraco', 2),(3, 'João Grilo', 2),
(4,'Varanalvo Criaspo', 2),(5,'Denunciano Faleceno',2 ),(6,'Mr. Expresso', 2),
(7,'Ferroso Forte',2,7),(8,'Caio Ribeiro',2,8),(9,'Diogo Freire', 2),
(10,'Fernando Fernandes', 2),
(11,'Herndez Prior', 1),(12,'Amelio Amado', 1);

/*Tabela de Veiculos*/
INSERT INTO `veiculos` (idveiculo, nome_marca, nome_modelo, ano, placa, idtipo_veiculo)
VALUES (1,'Wolkswagem','Gol',2006,'ABC2762', 2),(2,'Chevrolet','Chevetti',1980,'DFE2324', 2),
(3,'Mercedes','GLE63',2021,'ASD5676', 2),(4,'Tesla','Tesla',2077,'DFG2077', 2),
(5,'BMW','X5',2020,'KJH2424', 2),(6,'Chevrolet','S10',1995,'JNM0909', 1),
(7,'Chevrolet','Camaro',2020,'JHO1934', 2),(8,'Ford','Fox',2009,'KOP2324', 2),
(9,'Fiat','Van-Ducato',2012,'DFD7899', 1),(10,'Ford','Ranger',2022,'LKJ5621', 1);

/*Tabela de Clientes*/
INSERT INTO `clientes` (idcliente, nome_cliente, cpf, nascimento, cnh, categoria_cnh, telefone, email, nacionalidade)
VALUES (1,'Ana Clara Da Silva','145.552.873-82','1997-04-07','34974291008','B','61993459817','clara02@gmail.com','Brasil'),
(2,'Bartolomeu Lafontier Verenezi','456.789.123-24','1970-05-03','28374659231','B','63934562345','bart.13@gmail.com','Honduras'),
(3,'Carlos Henrique Ferreira','473.344.134-39','1969-06-14','12837463813','C','1194562902','Ferique1@gmail.com','EUA'),
(4,'Darwin Oliveira Da Silva','758.453.453-14','1964-07-19','41278374596','C','6287564519','dawin14@gmail.com','Philipinas'),
(5,'Elisa Sanches','435.768.976-12','1963-09-25','12384756900','B','619867784523','elisa03@gmail.com','Canada'),
(6,'Francisco Caupustino','754.768.876-15','1959-01-29','18293847568','B','1134567893','franboesa@gmail.com','Mexico'),
(7,'Gabriela Elisabete','123.456.789-34','1966-05-21','18273909405','B','451234567','gabi123@gmail.com','Brasil'),
(8,'Hiago Catropi','987.456.324-13','1986-05-14','85743923745','B','5699876758','hi32@gmail.com','Portugal'),
(9,'Joaquin Crespo Rabico','874.345.876-13','1974-11-12','18495847300','B','8712346578','Joa@gmail.com','Brasil'),
(10,'Kezia Roberta','768.987.345-45','1989-08-15','87364345871','C','8319232545','krta@gmail.com','Portugal');

/*Tabela de Registro de Aluguel*/
INSERT INTO `registro_aluguel` (idregistro, valor, data_entrega, data_saida, idveiculo, iduser, idperfil, idcliente)
VALUES (1, '10000','2022-03-07','2024-12-14', 1, 1, 2, 1),
(2, '60000,00','2024-09-03','2022-04-25', 2, 2, 2, 2),
(3,'42000,00','2024-05-03','2022-03-06', 3, 3, 2, 3),
(4, '1500000,00','3047-07-08','2022-04-10', 4, 4, 2, 4),
(5, '41000,00', '2027-09-10','2022-07-03',5, 5, 2, 5),
(6, '29000,00','2025-11-07','2022-07-03', 6, 6, 2, 6),
(7,'44000,00','2030-07-09','2023-09-07', 7, 7, 2, 7),
(8,'46000,00','2026-09-03','2023-09-10', 9, 8, 2, 8),
(9,'100000,00','2029-04-10','2023-03-17',8, 9, 2, 9),
(10,'200000,00','2031-07-09','2030-11-03', 10, 10, 2, 10),
(11,'50000,00','2024-10-12','2025-10-30',1, 1, 2, 2);






