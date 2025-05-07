select 
sales.product_id,
sales.date_date,
sales.orders_id,
sales.revenue,
sales.quantity, 
product.purchase_price,
ROUND(SUM(sales.quantity * product.purchase_price ),2) AS purchase_cost,
ROUND(SUM(sales.revenue -(sales.quantity * product.purchase_price)), 2) AS margin 
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} as sales
JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} as product
USING (product_id)
GROUP BY 
  sales.product_id,
  sales.date_date,
  sales.orders_id,
  sales.revenue,
  sales.quantity,
  product.purchase_price 
