-- Con este codigo podemos extraer a los clientes preferenciales (con mas arriendo de peliculas)

with gasto_clientesvip as (
   select customer_id, sum(amount) as gasto_total
   from payment
   group by customer_id
)
select c.first_name as "Nombre", c.last_name as "Apellido", c.email as "Email", g.gasto_total as "Total arriendo"
    from customer c
    inner join gasto_clientesvip g on c.customer_id = g.customer_id
    where g.gasto_total > 150;


-- La gerencia quiere saber qué categorías de películas (Acción, Comedia, Terror, etc.) están generando más ingresos.

with ingresos_categoria as (
select c.name as categoria, count(a.rental_id) as total_arriendos, sum(p.amount) as total_monto
	from category c 
	inner join film_category fc on c.category_id = fc.category_id
	inner join film pe on fc.film_id = pe.film_id
	inner join inventory i on pe.film_id = i.film_id
	inner join rental a on i.inventory_id = a.inventory_id
	inner join payment p on p.rental_id = a.rental_id
group by c.name
)
select categoria as "Categoría", total_arriendos as "Total arriendos", total_monto as "Total Ingresos", round(total_monto/total_arriendos,2) as total_promedio_arriendo
   from ingresos_categoria
   order by total_promedio_arriendo desc


--Cuántas películas tenemos retenidas o arrendadas actualmente que no han sido devueltas, para evaluar si necesitamos comprar más stock

with inventario_peliculas as (
   select c.name as categoria, 
   count(a.rental_id) as total_arriendos, 
   count( case when a.return_date is null then 1 end ) as peliculas_en_arriendo,
   sum(p.amount) as total_ingresos
   from category c
   inner join film_category fc on c.category_id = fc.category_id
   inner join film pe on fc.film_id = pe.film_id
   inner join inventory i on pe.film_id = i.film_id
   inner join rental a on i.inventory_id = a.inventory_id
   inner join payment p on a.rental_id = p.rental_id
   group by c.name
)
select categoria, total_arriendos, peliculas_en_arriendo, total_ingresos
   from inventario_peliculas
   order by total_ingresos desc
