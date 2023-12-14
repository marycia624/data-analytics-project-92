select to_char(sale_date, 'YYYY-MM') as date,
	count(distinct customer_id) as total_customers,
	floor(sum(quantity * price)) income
from sales s  
join products p on p.product_id  = s.product_id 
group by 1 
order by 1

select 
	case 
		when age between 16 and 25 then '16-25'
		when age between 26 and 40 then '25-40'
		when age > 40 then '40+'
	end as age_category, 
	count(distinct customer_id) as count
from customers c 
group by 1
order by 1
