# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create an admin user
admin_user = User.create!(
    email: 'admin@gmail.com',
    password: '124563sa',
    role: 'admin'
  )
  
  # Create a regular user
  regular_user = User.create!(
    email: 'user@gmail.com',
    password: '124563sa',
    role: 'user'
  )
  
  # Optionally, create some news associated with users
  News.create!(
    title: 'Admin News',
    body: 'This is a news article created by the admin user.',
    date: 21/01/2021,
    image: 'https://picsum.photos/200/300',
    user: admin_user
  )
  
  News.create!(
    title: 'Regular User News',
    body: 'This is a news article created by the regular user.',
    date: 21/01/2021,
    image: 'https://picsum.photos/200/300',
    user: regular_user
  )
  
