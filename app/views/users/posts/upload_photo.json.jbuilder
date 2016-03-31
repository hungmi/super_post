@file = @post.attachments.order(:id).last
json.file do
  json.id @file.id
  json.url @file.image.url
  json.thumbnailUrl @file.image.medium.url
  json.deleteUrl attachment_url(@file)
  json.deleteType "DELETE"
end
