# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "belgian" }
pizza_east = { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian" }
parmentier_north =  { name: "Pizza north", address: "68 avenue parmentier, LA CAPITALE", category: "french" }
japan_south = { name: "Pizza south", address: "31 avenue little boy, la zone", category: "japanese" }
chat_west = { name: "Pizza west", address: "west coast, la coast", category: "chinese" }


[dishoom, pizza_east, parmentier_north, japan_south, chat_west].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"



review1 = { rating: "5", content: "bbsdbfsdbfsbfhsbfh", restaurant: Restaurant.find_by(name: "Dishoom") }
Review.create(review1)
