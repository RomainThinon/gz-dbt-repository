SELECT 
  order_margin.orders_id, 
  order_margin.date_date, 
  order_margin.revenue, 
  order_margin.quantity, 
  order_margin.purchase_cost, 
  order_margin.margin, 
  ship.shipping_fee, 
  ship.logcost,
  ship.ship_cost,
  ROUND(SUM(order_margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost), 2) AS op_margin
FROM {{ ref('int_orders_margin') }} AS order_margin
JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS ship
USING (orders_id)
GROUP BY 
  order_margin.orders_id,
  order_margin.date_date,
  order_margin.revenue, 
  order_margin.quantity, 
  order_margin.purchase_cost,
  order_margin.margin,
  ship.shipping_fee, 
  ship.logcost,
  ship.ship_cost