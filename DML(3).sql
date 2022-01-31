use aluguel_carro;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_monitoramento_insert` AFTER INSERT ON `registro_aluguel` FOR EACH ROW begin
	insert into logs (acao, idveiculo, iduser)

	select 'inserted', idveiculo, iduser
	from registro_aluguel;
    
end$$
DELIMITER ;