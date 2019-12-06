
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
