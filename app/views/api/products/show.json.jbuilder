json.array! @comments do |comment|
  json.comment comment.comment
  json.nickname comment.user.nickname
  json.id comment.id
end