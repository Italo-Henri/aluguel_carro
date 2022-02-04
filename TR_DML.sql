use aluguel_carro;


/*DEVIDO A UMA LIMITAÇÃO DO MYSQL RESOLVI MIGRAR DE SGBD*/
/*E AGORA EU ESTOU USANDO ORACLE*/


CREATE TRIGGER tr_monitoramento
BEFORE INSERT OR UPDATE OR DELETE ON registro_aluguel
FOR EACH ROW
BEGIN
    INSERT INTO logs
      (idregistro,
       valor,
       data_entrega,
       data_saida,
       idveiculo,
       iduser,
       idperfil,
       idcliente)
  VALUES
      (:NEW.idregistro,
       :NEW.valor,
       :NEW.data_entrega,
       :NEW.data_saida,
       :NEW.idveiculo,
       :NEW.iduser,
       :NEW.idperfil,
       :NEW.idcliente
      );
EXCEPTION
   WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20001, 'tr_monitoramento - Erro Inserindo Log Na Tabela LOG : ' || SQLERRM);
END;

-- testando trigger
update registro_aluguel
set valor = 12345678,90
where idregistro = 2;
commit;

-- testando Delete
Delete from registro_aluguel where idregistro = 2;
commit;
