/* eu tirei dos dados os "erros" no cadastro dos sexos */
select sexo , (SQRT(sum(power((anos_de_estudo  - (select anos_de_estudo from rh where sexo = "feminino" group by sexo)) , 2)) / count(*) )) as desvio_padrao 
from rh 
where sexo = "Feminino";

select sexo , (SQRT(sum(power((anos_de_estudo  - (select anos_de_estudo from rh where sexo = "masculino" group by sexo)) , 2)) / count(*) )) as desvio_padrao 
from rh 
where sexo = "masculino";

