# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating users'
FactoryBot.create_list(:user, 15)
puts 'Create User Test'
FactoryBot.create(:user, email: 'test@example.com', password: '12345')
puts 'Creating books'
FactoryBot.create_list(:book, 15)
puts 'Creating games'
FactoryBot.create_list(:game, 15)
puts 'Creating plays'
FactoryBot.create_list(:play, 15)
puts 'Creating reads'
FactoryBot.create_list(:read, 15)
