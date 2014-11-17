json.array!(@work_orders) do |work_order|
  json.extract! work_order, :id, :worker_id, :status, :product_configuration_id, :purchase_order_id
  json.url work_order_url(work_order, format: :json)
end
