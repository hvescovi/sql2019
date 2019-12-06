/*72.

A:
*/
SELECT avg(salario_anual) from chicago where salario_ou_hora='Salary';
SELECT * from chicago ;
SELECT avg(((horas_tipicas*4)*12)*valor_hora) from chicago where salario_ou_hora='Hourly';
/*
Resposta= horista

B: 
Valor Horista ANTIGO= 61.566,903
Valor Assalariados= 87.845,372
*/
UPDATE chicago SET valor_hora = 1.01*valor_hora where salario_ou_hora='Hourly';
--Novo1= 62.182,573

UPDATE chicago SET valor_hora = 1.1*valor_hora where salario_ou_hora='Hourly';
--Novo2=67.723,594

UPDATE chicago SET valor_hora = 1.2*valor_hora where salario_ou_hora='Hourly';
--Novo3=73.880,284

UPDATE chicago SET valor_hora = 1.3*valor_hora where salario_ou_hora='Hourly';
--Novo4=80.036,975

UPDATE chicago SET valor_hora = 1.32*valor_hora where salario_ou_hora='Hourly';
--Novo5=81.268,313

UPDATE chicago SET valor_hora = 1.4*valor_hora where salario_ou_hora='Hourly';
--Novo6= 86.193,665          

UPDATE chicago SET valor_hora = 1.43*valor_hora where salario_ou_hora='Hourly';
--Novo7=88.040,672
