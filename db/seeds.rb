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

 camera1.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/hvx1_hinnde.jpg"), filename: 'hvx.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/hvx2_tobeld.jpg"), filename: 'hvx2.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/hvx3_eutoyu.jpg"), filename: 'hvx3.jpeg', content_type: 'image/jpg'}])

 camera2.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/g1003_jfzt5i.jpg"), filename: 'lumix100.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/g1002_irig4b.jpg"), filename: 'lumix1002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468620/development/rlm/lumix100_jlyr8v.jpg"), filename: 'lumix1003.jpeg', content_type: 'image/jpg'}])

 camera3.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/vx1000_elntgo.jpg"), filename: 'vx1000.jpeg', content_type: 'image/jpg'},
                        {	io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/vx10002_hxa9md.jpg"), filename: 'vx10002.jpeg', content_type: 'image/jpg'},
                        {	io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/vx10003_n2dxf0.jpg"), filename: 'vx10003.jpeg', content_type: 'image/jpg'}])

 camera4.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468620/development/rlm/hcx1_jfzr8q.jpg"), filename: 'hcx1.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/hcx12_cuhvyh.png"), filename: 'hcx12.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468620/development/rlm/hcx13_glship.jpg"), filename: 'hcx13.jpeg', content_type: 'image/jpg'}])

 camera5.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468620/development/rlm/Nikon-D5600_ru0s2k.jpg"), filename: 'D5600.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/d56002_semlyi.jpg"), filename: 'D56002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468619/development/rlm/d56003_ktur0a.jpg"), filename: 'D56003.jpeg', content_type: 'image/jpg'}])

 camera6.photos.attach([{io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/sonyvx2000_oa3hpg.jpg"), filename: 'vx2000.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/vx20002_ughktn.jpg"), filename: 'vx20002.jpeg', content_type: 'image/jpg'},
                        {io: URI.open("https://res.cloudinary.com/rlm1/image/upload/v1647468628/development/rlm/vx20003_pttj5z.jpg"), filename: 'vx20003.jpeg', content_type: 'image/jpg'}])

 puts "DB seeded!"
