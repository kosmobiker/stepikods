/*1 вывести список самых популярных tid
если имеется ввиду самый популярный tid среди фактически проданных, то*/
SELECT tid, COUNT(tid) as qty_tid
FROM sale
GROUP BY tid
ORDER BY qty_tid  DESC

/*2 вывести абонентов, которые за день пытались приобрести более 3 различных tid*/

Select DISTINCT id_private
FROM scoring
GROUP BY scor_date, tid
HAVING COUNT(tid) > 3

/*3 вывести абонентов, по которым не был отправлен запрос о кредитной истории*/

SELECT id_private
FROM   sale 
WHERE  id_private NOT IN (SELECT id_private FROM nbrb)

/*4 создать отчет по уровню одобрения/продаж 
(кол-во запросов, кол-во одобренных запросов, кол-во проданных устройств и проценты от кол-ва запросов)*/

--надо переделать

/*5 вывести абонентов, которые приходили 2 дня подряд*/

SELECT id_private, timestampdiff(day, LAG(request_date, 1) OVER (request_date) as diff_days
FROM nbrb
WHERE diff_days = 2
--надо переделать, выдаст ошибку