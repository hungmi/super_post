json.array!(@post.attachments) do |a|
  json.extract! a, :id
  # json.size a.image.size
  json.url a.image.url
  json.thumbnailUrl a.image.small.url
  json.deleteUrl attachment_url(a)
  json.deleteType "DELETE"
end
