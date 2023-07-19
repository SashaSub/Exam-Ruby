json.extract! order, :id, :monto_total, :fecha_orden, :product_id, :client_id, :payment_id, :created_at, :updated_at
json.url order_url(order, format: :json)
