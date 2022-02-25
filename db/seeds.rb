User.destroy_all

Camera.destroy_all

Booking.destroy_all

puts "DB cleaned!"

user1 = User.create!(first_name: "John", last_name: "Doe", email: "john@gmail.com", password: "Hello1")
user2 = User.create!(first_name: "Hafthor", last_name: "Jonsson", email: "BJonsson@gmail.com", password: "Hello1")
user3 = User.create!(first_name: "James", last_name: "Lame", email: "j@gmail.com", password: "Hello1")

camera1 = Camera.create!(category: "Video Camera HD", condition: "used", make: "Panasonic", model: "HVX", price: 850.00, year: 2003, user_id: user1.id)
camera2 = Camera.create!(category: "Mirrorless", make: "Panasonic", condition: "brand new", model: "Lumix G100", price: 600.00, year: 2020, user_id: user2.id)
camera3 = Camera.create!(category: "Video Camera Tape", condition: "slightly used", make: "Sony", model: "VX1000", price: 450.00, year: 2003, user_id: user3.id)

camera4 = Camera.create!(category: "Video Camera HD", condition: "brand new", make: "Panasonic", model: "HCX1", price: 850.00, year: 2003, user_id: user1.id)
camera5 = Camera.create!(category: "DSLR", make: "Nikon", condition: "brand new", model: "D5600", price: 500.00, year: 2018, user_id: user2.id)
camera6 = Camera.create!(category: "Video Camera Tape", condition: "slight cosmetic damage", make: "Sony", model: "VX2000", price: 650.00, year: 2003, user_id: user3.id)

 camera1.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645715359/development/hvx200_j2e6bz.jpg"), filename: 'hvx.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781245/development/hvx3_zo6nv4.jpg"), filename: 'hvx2.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781246/development/hvx2_xopvfq.jpg"), filename: 'hvx3.jpeg', content_type: 'image/jpg'}])

 camera2.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645715470/development/lumix100_whmwbv.jpg"), filename: 'lumix100.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781245/development/g1002_fu01vx.jpg"), filename: 'lumix1002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781244/development/g1003_m6nmhp.jpg"), filename: 'lumix1003.jpeg', content_type: 'image/jpg'}])

 camera3.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645715360/development/vx1000_fbmaac.jpg"), filename: 'vx1000.jpeg', content_type: 'image/jpg'},
                        {	io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645716688/development/vx10002_pjutyz.jpg"), filename: 'vx10002.jpeg', content_type: 'image/jpg'},
                        {	io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781247/development/vx10003_hb079y.jpg"), filename: 'vx10003.jpeg', content_type: 'image/jpg'}])

 camera4.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645717151/development/hcx1_a4zzx9.jpg"), filename: 'hcx1.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781253/development/hcx13_owvynh.jpg"), filename: 'hcx12.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781296/development/hcx12_q5dlom.png"), filename: 'hcx13.jpeg', content_type: 'image/jpg'}])

 camera5.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645717156/development/Nikon-D5600_lhyrza.jpg"), filename: 'D5600.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781244/development/d56002_tn18l3.jpg"), filename: 'D56002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781246/development/d56003_aicujv.jpg"), filename: 'D56003.jpeg', content_type: 'image/jpg'}])

 camera6.photos.attach([{io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645715359/development/sonyvx2000_t6utsx.jpg"), filename: 'vx2000.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781247/development/vx20002_t1vnyb.jpg"), filename: 'vx20002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/dpauqhmri/image/upload/v1645781248/development/vx20003_kng7by.jpg"), filename: 'vx20003.jpeg', content_type: 'image/jpg'}])

 puts "DB seeded!"
