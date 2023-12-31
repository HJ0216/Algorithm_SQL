  SELECT DISTINCT MCDP_CD "진료과 코드", 
         COUNT(APNT_NO) OVER (PARTITION BY MCDP_CD) "5월예약건수"
    FROM APPOINTMENT
   WHERE TO_CHAR(APNT_YMD, 'YYYY-MM') = '2022-05'
ORDER BY "5월예약건수", 
         "진료과 코드"
;
