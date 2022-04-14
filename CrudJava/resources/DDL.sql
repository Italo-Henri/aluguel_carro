create table perfil_usuario (
	id_perfil int not null auto_increment,
	tipo varchar(20) not null,
	data_criacao timestamp not null default current_timestamp,
	data_mod timestamp not null default current_timestamp on update current_timestamp,
	PRIMARY KEY (id_perfil)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

create table usuario(
	id_usuario int not null auto_increment,
	nome varchar(30) not null,
	sexo ENUM('m', 'f'),
	data_nasc date,
	login varchar(20) not null,
	senha varchar(11) not null,
	id_perfil int,
	data_criacao timestamp not null default current_timestamp,
	data_mod timestamp not null default current_timestamp on update current_timestamp,
	PRIMARY KEY (id_usuario),
	CONSTRAINT fk_idPerfil FOREIGN KEY (id_perfil) REFERENCES perfil_usuario(id_perfil)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

create table clientes(
	id_cliente int not null auto_increment,
	nome_cliente varchar(30) not null,
	sexo ENUM('M', 'F') not null,
	data_nasc date NOT NULL,
	email varchar(100) not null,
	senha varchar(11) not null,
	telefone varchar(11) not null,
	cpf varchar(11) not null,
	cnh varchar(11) not null,
	categoria_cnh enum('AB', 'B','C', 'D') not null,
	endereco VARCHAR(150) not null,
	bairro VARCHAR(50),
	cidade VARCHAR(50) not null,
	UF CHAR(2) not null,
	veiculo_alugado int,
	data_criacao timestamp not null default current_timestamp,
	data_mod timestamp not null default current_timestamp on update current_timestamp,
	PRIMARY KEY (id_cliente),
	constraint fk_veiculoAlugado foreign key (veiculo_alugado) references veiculos(id_veiculo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE veiculos(
	id_veiculo int not null auto_increment,
    modelo varchar(20) not null,
    fabricante varchar(20) not null,
    ano date not null,
    placa varchar(7) not null,
    tipo_vei int,
    primary key (id_veiculo),
    CONSTRAINT fk_tipoVei FOREIGN KEY (tipo_vei) REFERENCES tipo_veiculo(id_tipoVei)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE tipo_veiculo(
	id_tipoVei int not null auto_increment,
	nome_tipoVei varchar(20) not null,
	PRIMARY KEY (id_tipoVei)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE registro_de_aluguel (
	Valor decimal(10,2),
	id_veiculo int,
	id_usuario int,
	id_cliente int,
	data_entrega date,
	data_aluguel timestamp not null default current_timestamp,
	CONSTRAINT fk_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;