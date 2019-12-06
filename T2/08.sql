create database trab2;
use trab2;
--Cria tabelas enunciado: 


CREATE TABLE `dados` (
  `year` int(4) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `month` varchar(9) DEFAULT NULL,
  `number` int(5) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table if exists usuarios; 
create table usuarios(


        id  int not null,
    nome varchar(50) not null,
        email varchar(50) not null,
    estado_de_origem varchar(20) not null,
        primary key(id)
    
);


drop table if exists viagens;
create table viagens(
        id_usuario int not null,
    data_viagem date not null,
    estado_destino varchar(20) not null,
        FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);


drop table if exists periculosidade;
create table periculosidade(
        id_usuario int not null,
    data_viagem date not null
);


drop table if exists periculosidade_historico;
create table periculosidade_historico(
        id_usuario int not null,
    data_viagem date not null,
    nome varchar (50) not null
);


--Cria trigger que mostra e insere em periculosidade


Delimiter $


create trigger tgr_num_incendios before insert 
on viagens
for each row
begin
        declare num int;
        select sum(number) into num from dados
        where state = new.estado_destino;
    if num > 100000 then
                insert into periculosidade (id_usuario,data_viagem) values (new.id_usuario,new .data_viagem);
        end if;
end $


--trigger que faz backup no historico
create trigger tgr_periculosidade before delete 
on periculosidade
for each row 
begin
insert into periculosidade_historico (id_usuario,data_viagem) values (old.id_usuario,old.data_viagem);
end$