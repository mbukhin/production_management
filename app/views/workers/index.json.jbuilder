json.array!(@workers) do |worker|
  json.extract! worker, :id, :first_name, :photo_url, :last_name, :notes
  json.url worker_url(worker, format: :json)
end
