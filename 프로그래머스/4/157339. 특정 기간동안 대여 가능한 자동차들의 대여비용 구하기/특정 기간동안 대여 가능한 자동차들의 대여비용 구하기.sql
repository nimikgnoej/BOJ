select distinct A.CAR_ID,A.CAR_TYPE, round(A.DAILY_FEE*30*(100-C.DISCOUNT_RATE)*0.01,0) as FEE
from CAR_RENTAL_COMPANY_CAR as A
join CAR_RENTAL_COMPANY_RENTAL_HISTORY as B
on A.CAR_ID = B.CAR_ID
join CAR_RENTAL_COMPANY_DISCOUNT_PLAN as C
on A.CAR_TYPE = C.CAR_TYPE
WHERE A.CAR_ID NOT IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE END_DATE > '2022-11-01' AND START_DATE < '2022-12-01'
) 
AND C.DURATION_TYPE='30일 이상'
and A.CAR_TYPE IN ('세단', 'SUV')
GROUP BY A.CAR_ID
HAVING A.CAR_TYPE IN ('세단', 'SUV') AND (FEE>=500000 AND FEE<2000000) 

order by FEE desc, CAR_TYPE asc, CAR_ID desc

