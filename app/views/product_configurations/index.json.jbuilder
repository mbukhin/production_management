json.array!(@product_configurations) do |product_configuration|
  json.extract! product_configuration, :id, :color, :size, :cogs, :product_id, :sku, :image_url
  json.url product_configuration_url(product_configuration, format: :json)
end
