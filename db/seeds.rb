# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#   Categories should have title
titles = [
  'Ski Hardware',
  'Bags & Rucksacks',
  'Helmets & Protection',
  'Clothing',
  'Tents',
  'Sleeping Bags',
  'Footwear'
]

titles.each { |i| Category.create(title: i) }

#   Products should have name, description, image, price, category_id
70.times do
  Product.create(name:        Faker::Commerce.product_name,
                 description: Faker::Lorem.sentence,
                 image:       Faker::Avatar.image,
                 price:       Faker::Commerce.price,
                 category_id: rand(1..Category.all.size))
end
