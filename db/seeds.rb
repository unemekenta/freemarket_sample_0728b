require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

date = "2019-08-14"

CSV.foreach('db/condition.csv') do |info|
  Condition.create!(condition: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/status.csv') do |info|
  Status.create!(status: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/estimated_date.csv') do |info|
  EstimatedDate.create!(date: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/deliver_method.csv') do |info|
  DeliverMethod.create!(method: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/deliver_region.csv') do |info|
  DeliverRegion.create!(region: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/size_type.csv') do |info|
  SizeType.create!(size_type: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/size.csv') do |info|
  Size.create!(size: info[0], size_type_id: info[1], created_at: date, updated_at: date)
end

CSV.foreach('db/brand.csv') do |info|
  Brand.create!(brand: info[0], created_at: date, updated_at: date)
end

CSV.foreach('db/category.csv') do |info|
  Category.create!(category: info[0], parent_id: info[1], size_type_id: info[2], created_at: date, updated_at: date)
end