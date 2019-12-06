-- 64
-- a)
select `month`, state, sum(`number`) n
from dados
GROUP by state, `month`;

-- b)
select `year`, state, sum(`number`) n
from dados
where state in ('Amazonas', 'Amapa', 'Goias')
GROUP by state, `year`;

-- c)
select state, `year`, max(`number`)
from dados
group by state, `year`
order by MAX(`number`) desc
limit 5;

-- d)
select `month`, max(`number`)
from dados
group by `month`
order by max(`number`) desc
limit 1;

-- 67
create table usuario(	id NUMERIC,
						nome varchar(50),
						email varchar(50),
						estado_origem varchar(50),
						PRIMARY key (id));
					
create table viagem(	id NUMERIC,
						data_viagem date,
						estado_destino varchar(50),
						id_usuario numeric,
						valor_viagem numeric,
						primary key (id),
						FOREIGN key (id_usuario) REFERENCES usuario(id));
			
					
create table periculosidade( 	id_usuario NUMERIC,
								data_viagem date,
								PRIMARY KEY (id_usuario));

create table periculosidade_historico (	id_usuario NUMERIC,
										data_viagem date,
										PRIMARY KEY (id_usuario));
drop trigger viagem_insert;

create trigger viagem_insert after insert on viagem
for each row begin
	
	declare nr_incendios NUMERIC;
	
	select max(`number`)
	into nr_incendios
	from dados
	where state = new.estado_destino;
	
	if (nr_incendios > 100000) THEN
		insert into periculosidade values (new.id_usuario, new.data_viagem);
	
		update viagem
		set valor_viagem = valor_viagem*1.15
		where id = new.id;
	
	end if;
	
end;

create trigger periculosidade_delete before delete on periculosidade
for each row begin
	
	insert into periculosidade_historico values (old.id_usuario, old.data_viagem);
	
end;