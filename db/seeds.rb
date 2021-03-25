# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create!(username: 'user1', email: 'user1@email.com', password: '123')
@user2 = User.create!(username: 'user2', email: 'user2@email.com', password: '123')
@user3 = User.create!(username: 'user3', email: 'user3@email.com', password: '123')

# UserFriend.create!(user: @user1, friend: @user2)
# UserFriend.create!(user: @user2, friend: @user3)
