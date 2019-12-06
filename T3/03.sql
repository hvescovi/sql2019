-- Exercicio 72

-- Questão A:
SELECT avg(salario_anual) FROM chicago WHERE  salario_ou_hora='Salary';
SELECT avg(((horas_tipicas*4)*12)*valor_hora) FROM chicago WHERE  salario_ou_hora='Hourly';
-- R: Horista ganha mais

-- Questão B: 
-- Valor salario toal Assalariados= 87.845,372
-- Valor salario total Horista inical = 61.566,903

UPDATE chicago SET valor_hora = 1.01*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 62.182,573

UPDATE chicago SET valor_hora = 1.1*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 67.723,594

UPDATE chicago SET valor_hora = 1.2*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 73.880,284

UPDATE chicago SET valor_hora = 1.3*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 80.036,975

UPDATE chicago SET valor_hora = 1.32*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 81.268,313

UPDATE chicago SET valor_hora = 1.4*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor novo horista 86.193,665          

UPDATE chicago SET valor_hora = 1.43*valor_hora WHERE salario_ou_hora='Hourly';
-- Valor final horista 88.040,672