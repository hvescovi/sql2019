 -- 67)
 
create table usuario (
	id int PRIMARY key AUTO_INCREMENT,
	nome varchar(255),
	email varchar(255),
	estado_origem varchar(100)
);

create table viagem (
	id_usuario int,
	data_viagem date,
	estado_destino varchar(100),
	Foreign key (id_usuario) references usuario(id)
);

create table periculosidade (
	id_usuario int, data_viagem date, 
	foreign key (id_usuario) references usuario(id)
	);

create table periculosidade_historico like periculosidade;

DELIMITER |
CREATE TRIGGER trab after insert ON viagem
FOR EACH ROW
BEGIN
	set @num = (SELECT SUM(number) from dados where state = NEW.estado_destino);
	IF @num > 100000 then
		insert into periculosidade values (new.id_usuario, new.data_viagem);
	end if;
END|
DELIMITER ;

DELIMITER |
CREATE TRIGGER trab1 before delete ON periculosidade
FOR EACH ROW
BEGIN
	insert into periculosidade_historico values (old.id_usuario, old.data_viagem);
END|
DELIMITER ;
