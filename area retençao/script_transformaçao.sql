-- -------------- AREA RETENCAO ------------------
-- ----------------------------------------------------
-- ---------- TRANSFORMÃO - LIMPEZA -----------
-- ------------------------------------------
--
use areaRetencao;

-- mantem-se as mesmas tabelas
-- acrescenta-se a tabela:
-- AR_LIMPEZA_CLIENTE
-- nesta tabela vao os dados dos clientes das duas fontes limpos

-- meter no pentaho e mandar para a tabela de limpeza
-- passar nulls de cidade para 'desconhecido' e de nrbebes e criancas para 0
-- Passar da AR Mysql para a AR LIMPEZA CLIENTE
SELECT nif, 
nome, 
IFNULL(cidade, "desconhecido") AS cidade,
pais, 
tipoEstadia,
IFNULL(nrbebes, 0) AS nrBebes,
IFNULL(nrcriancas, 0) AS nrCriancas,
nradultos, 
datacheckin AS valid_from
FROM AR_cliente_mysql; 

-- Passar da AR EXCEL para a AR LIMPEZA CLIENTE
SELECT nif, 
nome, 
IFNULL(cidade, "desconhecido") AS cidade,
pais, 
tipoEstadia,
IFNULL(nrbebes, 0) AS nrBebes,
IFNULL(nrcriancas, 0) AS nrCriancas,
nradultos, 
datacheckin AS valid_from
FROM AR_cliente_excel;

-- verificar se resultou
SELECT * FROM AR_Limpeza_Cliente;

-- -----------
