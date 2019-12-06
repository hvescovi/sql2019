elect avg(anos_de_estudo) as Media_M
from rh where upper(sexo) = upper('masculino');

select avg(anos_de_estudo) as Media_F
from rh where upper(sexo) = upper('feminino');

select stddev(rh.anos_de_estudo) as Desvio_M from rh where upper(sexo) = upper('masculino');

select stddev(rh.anos_de_estudo) as Desvio_F from rh where upper(sexo) = upper('feminino');
