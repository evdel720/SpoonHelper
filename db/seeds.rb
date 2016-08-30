# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create!(email: "user1@example.com", password: "password", bio: "user 1's awesome bio")
User.create!(email: "user2@example.com", password: "password", bio: "user 2's awesome bio")
User.create!(email: "user3@example.com", password: "password", bio: "user 3's awesome bio")
User.create!(email: "user4@example.com", password: "password", bio: "user 4's awesome bio")
User.create!(email: "user5@example.com", password: "password", bio: "user 5's awesome bio")
User.create!(email: "user6@example.com", password: "password", bio: "user 6's awesome bio")
User.create!(email: "test", password: "password", bio: "test user's bio")
