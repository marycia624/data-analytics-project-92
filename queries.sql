
select first_name || ' ' || last_name as name,
	count(*) as operations,
	sum(quantity * price) income
from sales s 
join employees e on e.employee_id  = s.sales_person_id 
join products p on p.product_id  = s.product_id 
group by 1
order by 3 desc 
limit 10


with avg_all as (
	select avg(quantity * price) as avg_income
	from sales s 
	join products p on p.product_id  = s.product_id 
)
select first_name || ' ' || last_name as name,
	round(avg(quantity * price)) income
from sales s 
join employees e on e.employee_id  = s.sales_person_id 
join products p on p.product_id  = s.product_id 
group by 1
having avg(quantity * price) < (select avg_income from avg_all)
order by 2


select first_name || ' ' || last_name as name,
	case when to_char(sale_date, 'ID') = '1' then 'monday'
		when to_char(sale_date, 'ID') = '2' then 'tuesday'
		when to_char(sale_date, 'ID') = '3' then 'wednesday'
		when to_char(sale_date, 'ID') = '4' then 'thursday'
		when to_char(sale_date, 'ID') = '5' then 'friday'
		when to_char(sale_date, 'ID') = '6' then 'saturday'
		when to_char(sale_date, 'ID') = '7' then 'sunday'
	end as weekday,
	sum(quantity * price) income
from sales s 
join employees e on e.employee_id  = s.sales_person_id 
join products p on p.product_id  = s.product_id 
group by 1,to_char(sale_date, 'ID')
order by to_char(sale_date, 'ID'),1
