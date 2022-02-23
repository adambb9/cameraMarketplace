User.destroy_all

Camera.destroy_all

Booking.destroy_all

puts "DB cleaned!"

user1 = User.create!(first_name: "John", last_name: "Doe", email: "john@gmail.com", password: "Hello1")
user2 = User.create!(first_name: "Hafthor", last_name: "Jonsson", email: "BJonsson@gmail.com", password: "Hello1")
user3 = User.create!(first_name: "James", last_name: "Deo", email: "j@gmail.com", password: "Hello1")


Camera.create!(category: "Video Camera HD", condition: "used", make: "Panasonic", model: "HVX", price: 850.00, year: 2003, user_id: user1.id)
Camera.create!(category: "Mirrorless", make: "Panasonic", condition: "brand new", model: "Lumix G100", price: 600.00, year: 2020, user_id: user2.id)
Camera.create!(category: "Video Camera Tape", condition: "slightly used", make: "Sony", model: "VX1000", price: 450.00, year: 2003, user_id: user3.id)

puts "DB seeded!"
