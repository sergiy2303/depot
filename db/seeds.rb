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
categories_ids = Category.pluck(:id)
11.times do
  Product.create!(name:        Faker::Commerce.product_name,
                 description: Faker::Lorem.sentence,
                 remote_image_url:       Faker::Avatar.image.gsub('http', 'https'),
                 price:       Faker::Commerce.price,
                 category_id: categories_ids.sample)
end
