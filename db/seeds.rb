# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
UserInformation.destroy_all

5.times do
  user = User.new(
    {
      username: Faker::Movies::StarWars.character,
      password: 123456,
      email: Faker::Internet.email
    })
    user.save!
    p user.username
end

5.times do
  user_info = UserInformation.new(
    {
      online: true,
      github: Faker::Movies::StarWars.character,
      bio: Faker::Movies::StarWars.character,
      user: User.find(User.pluck(:id).sample)
    })
    user_info.save!
end

