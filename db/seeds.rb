# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all

20.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.yoda, email: Faker::Name.first_name.downcase + "@yopmail.com", password: Faker::Alphanumeric.alpha(number: 8))
end

6.times do
  event = Event.create!(start_date: Faker::Date.forward(days: 60), duration: Faker::Number.within(range: 12..100) * 5, title: Faker::Coffee.blend_name, description: Faker::GreekPhilosophers.quote, price: Faker::Number.between(from: 1, to: 1000), location: Faker::Restaurant.name, admin: User.all.sample)
end