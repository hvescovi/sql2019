-- a)

-- retorna media salarial anual dos horistas e não horistas
select
	(select avg(valor_hora * 252 * horas_tipicas / 5)
	from 	chicago
	where 	salario_ou_hora = 'Hourly') horista,
	(select avg(salario_anual)
	from 	chicago
	where 	salario_ou_hora = 'Salary') nao_horista;
    
delimiter //
create procedure menor_media_salarial(out menor_media_salarial varchar(20))
begin 
	DECLARE media_salario_horista INT;
	DECLARE media_salario_nao_horista INT;

	select 	avg(valor_hora * 252 * horas_tipicas / 5)
	into 	media_salario_horista
	from 	chicago
	where 	salario_ou_hora = 'Hourly';

	select 	avg(salario_anual)
    into 	media_salario_nao_horista
	from 	chicago
	where 	salario_ou_hora = 'Salary';

	if (media_salario_horista > media_salario_nao_horista) then
		set menor_media_salarial = 'Não horista';
    else
		set menor_media_salarial = 'Horista';
    end if;
    
    commit;
    
end //

delimiter ;
-- b)

select
	(select avg(valor_hora * 252 * horas_tipicas / 5 * 1.349)
	from 	chicago
	where 	salario_ou_hora = 'Hourly') horista,
	(select avg(salario_anual)
	from 	chicago
	where 	salario_ou_hora = 'Salary') nao_horista;
    
-- resposta b) por volta de 34.5% as médias se tornam similares.
