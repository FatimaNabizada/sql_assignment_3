--1.List all customers who live in Texas(use JOINs)
select first_name,district
from customer
inner join address
on address.address_id = customer.address_id
inner join city
on city.city_id = address.city_id
where district like 'Texas';

--2.Get all payments about $6.99 with Customer's Full Name
select first_name, last_name,amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3.Show all customers names who have made payments over $175(use subquries)
select first_name
from customer
where customer_id in(
	select customer_id
	from payment
	where amount > 175
	
);

--4. List all customer that in Nepal (use the city table)
select first_name, country
from customer
inner join address 
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal';

--5. Which staff member has the most transations?


select first_name,max(amount)
from staff
left join payment
on payment.staff_id = staff.staff_id
group by first_name;

--6.How many movies of each rating are there?
select * from film;
select title,count(rating), max(rating)
from film
group by title
order by title desc ;

--7.Show all customers who have made single payment above $6.99(Use Subqueries)

select first_name
from customer
where customer_id in(
	select customer_id
	from payment
	where amount = 6.99
	
);

--8. How many free rentals did our stores give away?
select * 
from rental
full join inventory
on inventory.inventory_id = rental.inventory_id 
full join store
on store.store_id = inventory.store_id
where inventory.store_id = null;





















