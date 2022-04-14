INSERT INTO perfil_usuario (tipo, data_criacao, data_mod) VALUES ('administrador', now(), now());
INSERT INTO perfil_usuario (tipo, data_criacao, data_mod) VALUES ('vendedor', now(), now());

INSERT INTO usuarios (nome, sexo, data_nasc, login, senha, id_perfil, data_criacao, data_mod) VALUES('admin', 'm', curdate(), 'admin', '1234', 1, now(), now());
