select 
(sales.quantity * product.purchase_price ) AS purchase_cost
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} as sales
JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} as product
USING (product_id)
