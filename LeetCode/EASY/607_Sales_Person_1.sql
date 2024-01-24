select name
  from SalesPerson
 where sales_id not in
(
    select sales_id
      from Orders
     where exists 
    (
        select com_id
          from Company
         where Orders.com_id = Company.com_id 
           and name = 'RED'
    )
)
;
