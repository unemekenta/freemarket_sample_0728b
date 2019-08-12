# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
  ProductImage.create(image: "https://static.mercdn.net/item/detail/orig/photos/m68109283584_1.jpg?1564813817", product_id: i , created_at: "2019-08-12", updated_at: "2019-08-12")
end