select product_name, transaction_seller_id from customer_inventories 
left join transactions on customer_inventories.customer_id = transactions.transaction_buyer_id
WHERE transaction_type != 'Self' and customer_id = 'henry.anderson@example.com'

select transaction_seller_id from transactions where transaction_type = 'Farmer & Distributor' and transaction_buyer_id = 'vincent.hayes@example.com' and transaction_product_name = 'Quinoa'

select * from farmers where farmer_id = 'zachary.coleman@example.com'

select * from users where user_id  = 'ursula.smith@example.com' -- added as a farmer then into customer table 