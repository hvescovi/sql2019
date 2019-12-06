SELECT sum(anos_de_estudo) FROM rh where sexo='masculino';
SELECT sum(anos_de_estudo) FROM rh where sexo='feminino';

ALTER TABLE rh ADD dp2 VARCHARACTER(10);
SELECT anos_de_estudo 
FROM rh 
where sexo='masculino' 
AND sum((anos_de_estudo)-(15.5382)) = 0;

select sqrt(sum(power(anos_de_estudo - 15.5382, 2))/count(*)) desvio_padrao_masc
from rh
where lower(sexo) in('masculino','masc');

select sqrt(
sum(
power(anos_de_estudo - media_anos.media, 2)
)/count(rh.unidade)) desvio_padrao, rh.sexo
from rh, media_anos
where rh.sexo = media_anos.sexo
and rh.sexo <> ''
group by rh.sexo;

drop view media_anos;
create view media_anos as
select avg(anos_de_estudo) media, sexo
from rh
group by 2;

update rh
set sexo = 'Feminino'
where sexo = 'Femi';


UPDATE INTO dp2(SELECT anos_de_estudo FROM rh where sexo='masculino' AND sum((anos_de_estudo)-('15.5382')));
VALUES ();

SELECT sum(anos_de_estudo) FROM rh where sexo='masculino';

select distinct sexo
from rh;

UPDATE rh SET dp2 = ();