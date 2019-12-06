primeira forma

select(select avg(salario_anual) from chicago where salario_ou_hora = 'Salary') assalariados,
(select avg((horas_tipicas/5) * valor_hora * 252 * 1.3588836)from chicago where salario_ou_hora = 'Hourly') horistas




segunda forma

start transaction;

UPDATE chicago SET valor_hora = valor_hora*1.3588836 WHERE salario_ou_hora ="Hourly"

select(select avg(salario_anual) from chicago where salario_ou_hora = 'Salary') assalariados,
(select avg((horas_tipicas/5) * valor_hora * 252)from chicago where salario_ou_hora = 'Hourly') horistas
      
rollback;

