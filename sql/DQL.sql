use aluguel_carro;


/*selecionar todos os dados de cada tabela, ou seja, um select pra cada;*/

select * from clientes c ;

select * from registro_aluguel ra ;

select * from `user` u ;

select * from veiculo v ;

select * from tipo_veiculo tv ;

select * from perfil_user pu ;



/*selecionar apenas os nomes da tabela de clientes e usuários 'alias';*/

select nome_cliente from clientes c ;
select nome_user from `user` u ;


/*selecionar apenas os nomes dos usuários q sejam vendedores;*/

select nome_user, idperfil from `user` u 
where idperfil = 2;


//*selecionar apenas os modelos dos veículos q sejam utilitarios*//

select nome_modelo, idtipo_veiculo from veiculo v 
where idtipo_veiculo = 1;


/*selecionar todos os registros de aluguel de um único vendedor;*/

select * from registro_aluguel ra 
where ra.iduser = 1;

select u.nome_user from registro_aluguel ra 
join `user` u ON  u.iduser = ra.iduser 
where ra.iduser = 1;


/*selecionar todos os registros de aluguel de um único veículo;*/

select * from registro_aluguel ra 
where ra.idveiculo = 1;


select v.nome_modelo, v.nome_marca from registro_aluguel ra 
join veiculo v on ra.idveiculo = v.idveiculo 
where ra.idveiculo = 1;
