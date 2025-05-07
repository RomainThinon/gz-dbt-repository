

SELECT date_date,
ROUND(SUM(revenue), 2) as daily_revenue, 
ROUND(SUM(ship_cost), 2) as daily_ship_cost, 
ROUND(SUM(op_margin), 2) as daily_op_margin, 
ROUND(SUM(purchase_cost), 2) as daily_purchase_cost, 
ROUND(SUM(shipping_fee), 2) as daily_shipping_fee,
ROUND(SUM(logcost), 2) as daily_logcost,
COUNT(DISTINCT orders_id) as daily_transaction, 
ROUND(SUM(revenue)/COUNT(DISTINCT orders_id), 2) as avg_basket
FROM {{ ref('int_orders_operational') }} 
GROUP BY date_date
ORDER BY date_date DESC 

