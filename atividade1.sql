CREATE ROLE 'consulta_relatorio', 'acesso_funcionario';

GRANT SELECT ON uc4atividades.* TO 'consulta_relatorio';

GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'acesso_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'acesso_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'acesso_funcionario';
FLUSH PRIVILEGES;
				/*usuarios*/
CREATE USER 'userRelatorio'@'localhost' IDENTIFIED BY '123';
SHOW GRANTS FOR 'userRelatorio'@'localhost';

CREATE USER 'userFuncionarios'@'localhost' IDENTIFIED BY '321';
SHOW GRANTS FOR	 'userFuncionarios'@'localhost';
/**********************************************************/

				/*privilegios */
GRANT 'consulta_relatorio' TO 'userRelatorio'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'userRelatorio'@'localhost';

GRANT 'acesso_funcionario' TO 'userFuncionarios'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'userFuncionarios'@'localhost';
/**********************************************************/

					/* set usuarios*/
set default role 'consulta_relatorio' TO 'userRelatorio'@'localhost';
set default role 'acesso_funcionario' TO 'userFuncionarios'@'localhost';
select* from mysql.user;