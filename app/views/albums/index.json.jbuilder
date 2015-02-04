json.array!(@albums) do |album|
  json.extract! album, :id, :name, :owner
  json.url album_url(album, format: :json)
end
