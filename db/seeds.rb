# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
users_data = []
10.times do
  users_data.push({
    name: Faker::Name.unique.name,
    is_active: true,
    emp_id: rand(36*5).to_s(36),
    role_id:Faker::Number.between(from: 1, to: 10),
    email: Faker::Internet.unique.email,
    password: 'admin007',
    password_confirmation: 'admin007'
  })
end
User.create(users_data)