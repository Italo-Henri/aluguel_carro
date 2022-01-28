use aluguel_carro;

/*CRIAÇÃO DE TABELAS*/

/*Tabela de Perfil de usuário*/
CREATE TABLE `perfil_user` (
  `idperfil` int NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(255) NOT NULL,
  `data_criacao` date DEFAULT '2022-01-01',
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Tipos de Veículo*/
CREATE TABLE `tipo_veiculo` (
  `idtipo_veiculo` int NOT NULL AUTO_INCREMENT,
  `nome_tipo_veiculo` varchar(255) NOT NULL,
  PRIMARY KEY (`idtipo_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de usuários*/
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `nome_user` varchar(255) NOT NULL,
  `idperfil` int NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `idperfil` (`idperfil`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil_user` (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Veiculos*/
CREATE TABLE `veiculos` (
  `idveiculo` int NOT NULL AUTO_INCREMENT,
  `nome_marca` varchar(255) NOT NULL,
  `nome_modelo` varchar(255) NOT NULL,
  `ano` int NOT NULL,
  `placa` varchar(7) NOT NULL,
  `idtipo_veiculo` int NOT NULL,
  PRIMARY KEY (`idveiculo`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idtipo_veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Clientes*/
CREATE TABLE `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(30) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `nascimento` date NOT NULL,
  `cnh` varchar(11) NOT NULL,
  `categoria_cnh` enum('B','C') DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) NOT NULL,
  PRIMARY KEY (`idcliente`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Tabela de Registro de Aluguel*/
CREATE TABLE `registro_aluguel` (
  `num_registro` int NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) NOT NULL,
  `data_entrega` date DEFAULT '2022-01-01',
  `data_saida` date DEFAULT '2022-01-01',
  `idveiculo` int NOT NULL,
  `iduser` int NOT NULL,
  `idperfil` int NOT NULL,
  `idcliente` int NOT NULL,
  PRIMARY KEY (`num_registro`),
  KEY `idveiculo` (`idveiculo`),
  KEY `iduser` (`iduser`),
  KEY `idperfil` (`idperfil`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `registro_aluguel_ibfk_1` FOREIGN KEY (`idveiculo`) REFERENCES `veiculo` (`idveiculo`),
  CONSTRAINT `registro_aluguel_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`),
  CONSTRAINT `registro_aluguel_ibfk_3` FOREIGN KEY (`idperfil`) REFERENCES `perfil_user` (`idperfil`),
  CONSTRAINT `registro_aluguel_ibfk_4` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;







