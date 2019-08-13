# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
  Product.create(name: "【新品未使用】PATRICK COX (パトリックコックス) シューズ 黒", price: 808976, detail: "【新品未使用】PATRICK COX (パトリックコックス) シューズ 黒", status_id: 2, condition_id: 4, created_at: "2019-08-12", updated_at: "2019-08-12")
  ProductImage.create(image: "https://static.mercdn.net/thumb/photos/m80932943959_1.jpg?1565686566", product_id: i , created_at: "2019-08-12", updated_at: "2019-08-12")
end