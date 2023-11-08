-- to do 

select * from farmer_inventories
select * from customer_inventories 
where product_quantity = 0 
-- remove from inventories list if quantities are 0 

select * from users --143
select count(distinct(user_id))from users --143 

-- check for product availability
select * from distributor_inventories -- select source as farmer, distributor, customer
where product_name = 'Corn' and product_quantity > 0 --select product name dropdown and quantity

-- check a specific customers items
select * from customer_inventories
where customer_id = 'xavier.barnes@example.com' and product_quantity > 0


--