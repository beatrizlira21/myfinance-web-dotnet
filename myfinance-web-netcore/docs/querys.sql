select count(*) from TRANSACAO where tipo = 'D'
select count(*) from TRANSACAO where tipo = 'R'
select sum(valor) from TRANSACAO where tipo = 'D'
select sum(valor) from TRANSACAO where tipo = 'R'
select avg(valor) from TRANSACAO where tipo = 'D'
select avg(valor) from TRANSACAO where tipo = 'R'
select max(valor) from TRANSACAO where tipo = 'D'
select max(valor) from TRANSACAO where tipo = 'R'
select min(valor) from TRANSACAO where tipo = 'D'
select min(valor) from TRANSACAO where tipo = 'R'

select * from TRANSACAO where data >= '20240101 00:00:00' and data <= '20240331 23:59:59'
select * from TRANSACAO where data between '20240101 00:00:00' and '20240331 23:59:59'

select tipo, sum(valor) from TRANSACAO 
where data >= '20240101 00:00:00' and data <= '20241231 23:59:59'
group by tipo

select T.*, P.nome AS Categoria
from TRANSACAO AS T INNER JOIN PLANOCONTA AS P
ON T.planocontaid = P.id
where data >= '20240101 00:00:00' and data <= '20241231 23:59:59'

--Como descobrir quais categorias de plano de contas ainda não possuem transações vinculadas?
select P.ID, P.NOME, T.ID AS CODIGOTRANSACAO
FROM PLANOCONTA AS P LEFT JOIN TRANSACAO AS T
ON P.id = T.planocontaid
WHERE T.ID IS NULL
