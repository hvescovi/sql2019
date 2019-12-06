
-- CRIANDO VISÃO DE MEDIA DE ANO POR SEXO 
CREATE view media_ano_estudo 
AS 
  SELECT Avg(Cast(a.anos_de_estudo AS UNSIGNED)) anos, 
         a.sexo                                  sexo 
  FROM   data a 
  GROUP  BY 2; 

-- SELECT DE MÉDIA POR SEXO 
SELECT * 
FROM   media_ano_estudo; 

-- SELECT DE APLICAÇÃO DA FÓRMULA DE DESVIO PADRÃO  
SELECT Sqrt(Sum(Power(Cast(a.anos_de_estudo AS UNSIGNED) - 
            b.anos, 2)) / Count(*)) desvio, 
       a.sexo sexo 
FROM   data a, 
       media_ano_estudo b 
WHERE  a.sexo = b.sexo 
GROUP  BY 2; 

/* 
	Analisando somente as médias, podemos identificar que os homens estudam mais anos que mulheres. 
	Porém, ao analisar o desvio padrão dos dois resultados organizados por sexo, identificamos que os valores apresentados se equivalem uns aos outros. 
	Ou seja, o desvio padrão das mulheres, alcança a média dos homens, e, o desvio padrão dos homens abaixa a ponto de alcançar a média das mulheres. 
	Com isso, não podemos com certeza absoluta afirmarmos que os homens estudam mais que as mulheres, ou vice-versa, pois a base de dados não é grande suficiente para afirmar tal sentença. 

*/

