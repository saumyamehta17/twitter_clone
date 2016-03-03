json.array!(@rabbits) do |rabbit|
  json.extract! rabbit, :id, :content, :user_id_id
  json.url rabbit_url(rabbit, format: :json)
end
