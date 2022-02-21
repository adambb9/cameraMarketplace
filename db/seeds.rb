# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

Camera.destroy_all
puts "DB cleaned!"

user1 = User.create!(first_name: "John", last_name: "Doe", email: "john@gmail.com", password: "Hello1")
user2 = User.create!(first_name: "Hafthor", last_name: "Jonsson", email: "BJonsson@gmail.com", password: "Reykjavik")

Camera.create!(category: "Video Camera HD", condition: "used", make: "Panasonic", model: "HVX", price: 750.00, year: 2003, user_id: user1.id)
Camera.create!(category: "Mirrorless", make: "Panasonic", condition: "brand new", model: "Lumix G100", price: 600.00, year: 2020, user_id: user2.id)
puts "DB seeded!"
