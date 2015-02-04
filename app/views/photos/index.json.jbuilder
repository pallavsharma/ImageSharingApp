json.array!(@photos) do |photo|
  json.extract! photo, :id, :name, :tag_line, :owner
  json.url photo_url(photo, format: :json)
end
