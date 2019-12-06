select sqrt(sum(pow(a.anos_de_estudo - 
            b.media_anos_estudo, 2)) / Count(1)) desvio, b.media_anos_estudo, a.sexo
from data a,
( 	select avg(anos_de_estudo) media_anos_estudo, sexo
	from data
	group by(sexo) ) b
where a.sexo = b.sexo
group by sexo;

/*
 * conclui-se que estatisticamente a diferença entre gêneros pode ser desprezado.
 */