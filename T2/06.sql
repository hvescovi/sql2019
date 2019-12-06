-- 64. a) Qual é o número de incêndios por mês? Em qual estados ocorre mais incêndios?
select month, sum(number)
from dados
group by month;

select state, sum(number)
from dados
group by state
order by sum(number) desc;

-- b) Tem-se dito que houve grande aumento de queimadas nos últimos anos. Com base
-- nos dados, escolha alguns estados e verifique se tal informação é verdadeira.

select state, year, sum(number)
from dados
where state in ('Mato Grosso')
group by year
order by year desc

-- c) Qual foi o maior número de queimadas registrado? Informe também o estado, ano e 
-- mês referentes a esse maior valor. Mostre os 5 maiores números de queimadas, 
-- com as informações de estado, ano e mês

select state, year, month, number
from dados
order by number desc
-- Mato Grosso - 2007 - Setembro, 25.963

-- d) É possível determinar, de forma geral, qual o mês com maior número de queimadas?
-- Sim, setembro, conforme SQL abaixo.
select month, sum(number)
from dados
group by month
order by sum(number) desc;

-- 65.
drop table if exists resultado;
create table if not exists resultado(
	valor float,
	media float
);

drop procedure if exists calc_inced_media;
DELIMITER $$;
create procedure calc_inced_media()
begin
	declare media float;
	declare fim bool default false;
	declare numero float;
	declare c_inced cursor for 
		select number
		from dados;
	declare continue handler for not found set fim = true;
	select avg(number)
	into media
	from dados;
	
	open c_inced;
	laco_cursor : loop
	fetch c_inced into numero;
	if numero > media then
		insert into resultado values (numero, media);
	end if;
	if fim = true then
		leave laco_cursor;
	end if;
	end loop;
	close c_inced;
end$$
delimiter ;

call calc_inced_media; -- roda a procedure

-- 66.

create table incendios_log(
	year int,
	state varchar(200),
	month varchar(200),
	number int,
	date varchar(200)
);

drop trigger if exists t_updt_inced;
delimiter $$
create trigger t_updt_inced before update on dados
for each row
begin
	insert into incendios_log values (old.year, old.state, old.month, old.number, old.date);
end$$
delimiter ;

drop trigger if exists t_del_inced;
delimiter $$
create trigger t_del_inced before delete on dados
for each row
begin
	insert into incendios_log values (old.year, old.state, old.month, old.number, old.date);
end$$
delimiter ;


delete from dados; -- limpa toda a tabela
select *
from incendios_log; -- tudo salvo aqui :)
