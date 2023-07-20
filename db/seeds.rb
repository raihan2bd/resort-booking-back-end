# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: 'Testing')

resort1 = Resort.create(name: 'Maldives', location: 'Madrid', price: 20.0, description: 'loren ipsum', guests_amount: 30, image_url: 'images_tttt', user_id: user1.id )

booking1 = Booking.create(start_date: '2023-05-19', end_date: '2023-05-29', address: 'lorem ipsum', user_id: user1.id, resort_id: resort1.id)