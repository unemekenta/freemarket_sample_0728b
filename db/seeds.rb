# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times {|n|
  Product.create(name: "アンパンマン スニーカー" , price: 1100 , detail: 'キッズ用のアンパンマンスニーカーです。\n1年前、大阪梅田の阪神百貨店で購入しました。', status_id: 1, condition_id: 5)
}