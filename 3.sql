SELECT COUNT(DISTINCT customer.CUS_ID) as CustomerId,CUS_GENDER from customer INNER JOIN `order` ON customer.CUS_ID=`order`.CUS_ID WHERE ORD_AMOUNT>=3000 GROUP BY CUS_GENDER 