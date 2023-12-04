CREATE PROCEDURE summary_order_status 
	@ID INT
AS
BEGIN
    SELECT 
		sales_order.order_id,
		customer.first_name,
		product.product_name,
		sales_order.quantity,
		status_order.status_order
	FROM sales_order 
		JOIN customer ON sales_order.customer_id = customer.customer_id
		JOIN product ON sales_order.product_id = product.product_id
		JOIN status_order on sales_order.status_id= status_order.status_id
	WHERE sales_order.status_id = @ID ;
END;