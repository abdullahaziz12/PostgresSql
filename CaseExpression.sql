select concat_ws(' ', name,surname),salary,
case 
	when salary>0 then round(salary*.10)
end as bonus
from bank;

select 
case 
	when salary>100000 then 'high'
	else 'low'
end as sal_cat,count(id)
from bank group by(sal_cat);
