json.array! @customers do |user|
  json.id user.id
  json.name user.name
end