/*CRIANDO BANCO DE DADOS*/
create database aluguel_carro
default character set utf8
default collate utf8_general_ci;

/*CRIAÇÃO DE TABELAS*/

use aluguel_carro;

/*Tabela de Perfil de usuário*/
CREATE TABLE `perfil_user` (
  `idperfil` int NOT NULL auto_increment,
  `nome_perfil` varchar(15) NOT NULL,
  `data_criacao` date DEFAULT '2022-01-01',
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Tipos de Veículo*/
CREATE TABLE `tipo_veiculo` (
  `idtipo_veiculo` int NOT NULL,
  `nome_tipo_veiculo` varchar(15) NOT NULL,
  PRIMARY KEY (`idtipo_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de usuários*/
CREATE TABLE usuario (
  `iduser` int NOT NULL auto_increment,
  `nome_user` varchar(100) NOT NULL,
  `idperfil` int NOT NULL,
  PRIMARY KEY (`iduser`),
  FOREIGN KEY (`idperfil`) REFERENCES `perfil_user` (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Veiculos*/
CREATE TABLE `veiculos` (
  `idveiculo` int NOT NULL auto_increment,
  `nome_marca` varchar(100) NOT NULL,
  `nome_modelo` varchar(100) NOT NULL,
  `ano` int NOT NULL,
  `placa` varchar(7) NOT NULL,
  `idtipo_veiculo` int NOT NULL,
  PRIMARY KEY (`idveiculo`),
  FOREIGN KEY (`idtipo_veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Clientes*/
CREATE TABLE `clientes` (
  `idcliente` int NOT NULL auto_increment,
  `nome_cliente` varchar(30) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `nascimento` date NOT NULL,
  `cnh` varchar(11) NOT NULL,
  `categoria_cnh` enum('B','C') DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Registro de Aluguel*/
CREATE TABLE `registro_aluguel` (
  `idregistro` int NOT NULL auto_increment,
  `valor` decimal(10,2) NOT NULL,
  `data_entrega` date DEFAULT '2022-01-01',
  `data_saida` date DEFAULT '2022-01-01',
  `idveiculo` int NOT NULL,
  `iduser` int NOT NULL,
  `idperfil` int NOT NULL,
  `idcliente` int NOT NULL,
  PRIMARY KEY (`idregistro`),
  FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`),
  FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`),
  FOREIGN KEY (`idperfil`) REFERENCES `perfil_user` (`idperfil`),
  FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE logs (        
 idregistro INT auto_increment,
 valor decimal(10,2),
 data_entrega date,
 data_saida date,
 idveiculo INT,
 iduser int,
 idperfil int,
 idcliente int);







