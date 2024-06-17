--select * from sales.customers
--select first_name, last_name, email from sales.customers
--select first_name+' '+last_name as "Fullname" from sales.customers
--select s.email from sales.customers s

/* Sorting of Data
- Order by clause
- order it in ascending
- order it in descending
*/

--select first_name,last_name,city,zip_code from sales.customers order by city desc, last_name asc

/* Filtering of Data
- Where clause
*/

--select * from sales.customers where zip_code = '10598' and last_name != 'Reese' order by first_name desc

--select * from production.stocks where quantity>28
--select * from production.stocks where quantity<27 and quantity>25
--select state,first_name from sales.customers where (state!='CA' or state!='NY') and city='Apple Valley'
--select distinct state from sales.customers
--select state, first_name, city from sales.customers where state not in ('CA','NY')

--select * from sales.customers where phone is null

--Like

--select * from sales.customers where first_name like 'An%' and last_name like '%in'
--select * from sales.customers where first_name like '%st%'
--select * from sales.customers where first_name like '____st%'

--select distinct model_year from production.products
--select * from production.products where model_year between 2016 and 2018

/*
Aggregation and Filtering: Gropu by and Having Clause

*/

--Group functions

--select count(*) from production.products
--select count(phone), count(*) from sales.customers

--select count(model_year), count(distinct model_year) from production.products
--select count(*) as 'total_products' , max(list_price) as 'maximum price', min(list_price) 'Minimum',avg(list_price) 'Average' from production.products where model_year=2019

--select model_year, count(model_year) as 'no of products',sum(list_price) 'total price', avg(list_price) 'average price' 
--from production.products group by model_year having count(model_year)>50

--select product_name, model_year, list_price, avg(list_price) over (partition by model_year) 
--as "avgprice", list_price-avg(list_price) over (partition by model_year) as "difference"
--from production.products where model_year='2016'

--select top(10) * from production.products order by model_year desc
--select top 20 percent * from production.products
--select SUBTABLE.* from (select product_name, model_year, category_id, list_price from production.products 
--where model_year=2016) as SUBTABLE where subtable.category_id=3

--select format(8976567878, '###-###-####')
--select format(list_price,N'C', N'en-In') from production.products

--select list_price, format(list_price,N'C', N'en-In') from production.products

--select format(GETDATE(), 'yyyy-MMM-dd')

--select upper(category_name), left(category_name,5), len(category_name), right(category_name,5) from production.categories

--update production.categories set category_name = '  ' + category_name + '   '
--select * from production.categories

--select trim(category_name), upper(category_name), left(category_name,5), len(category_name) from production.categories

--select category_name, patindex('%BI_y%',category_name) from production.categories

--select category_name, replace(category_name, 'Bikes', 'MotorBikes'), REVERSE(category_name) from production.categories

--update production.categories set category_name = trim(category_name)

--select list_price, len(list_price), str(list_price) from production.products

--select substring(product_name,5,10) from production.products
--select current_timestamp, GETDATE()

--select dateadd(year,2,getdate()) "2 year after current date",
--dateadd(year,-2,getdate()) "2 year before current date"

--select dateadd(month,2,getdate()) "2 months after current date",
--dateadd(month,-2,getdate()) "2 months before current date"

-- Day, week, houre, minute, second, millisecond

-- select * from dbo.emp

--select hiredate, datediff(Year,hiredate,getdate()), datediff(Month,hiredate,getdate()), datename(month, hiredate),datename(weekday,hiredate) from emp

--select sal, comm, round(sal,0) from emp

--select list_price, round(list_price,1), ceiling(list_price),floor(list_price),abs(-10) from production.products

--select rand(10)*10

-------------------------------------------

--select comm, iif(comm>0.00, 'Commision Recieved', 'No Commision') as Result from emp
--select sal,comm, iif(comm>0.00, sal+comm, sal) as total_salary from emp
--select sal, isnull(comm,0.00),iif(comm>0.00, sal+comm, sal) as total_salary from emp     --chnaging null value to 0.00

--select USER_NAME()
--select SYSTEM_USER

