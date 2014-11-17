json.array!(@materials) do |material|
  json.extract! material, :id, :name, :unit, :internal_name
  json.url material_url(material, format: :json)
end
