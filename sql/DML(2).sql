use aluguel_carro;

/*Mudando os modelos dos carros*/
update veiculo 
set idtipo_veiculo = 1, nome_modelo = 'Golf' 
where idveiculo = 1;

update veiculo 
set nome_modelo = 'Uno', nome_marca = 'Fiat', idtipo_veiculo = 1
where idveiculo = 2;

update veiculo 
set idtipo_veiculo = 1, nome_modelo = 'SpaceFox' 
where idveiculo = 8;

/*Delete*/

/*Deletando Registros*/
delete from registro_aluguel 
where idregistro = 2;

delete from registro_aluguel 
where idregistro = 3;

/*Deletando Usuarios*/
delete from `user` 
where iduser = 2;

delete from `user` 
where iduser = 3;