# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Post.destroy_all
# User.destroy_all
#
# 200.times do
#   password = Faker::Internet.password
#   User.create(
#     username:Faker::Internet.username,
#     email:Faker::Internet.email,
#     bio:Faker::Hipster.sentence,
#     location:Faker::Address.city,
#     password:password,
#     password_confirmation:password
#     )
# end
#
# dogs = Dir.glob("public/uploads/seed/*")
#
# dogs.each do |dog|
#   post = Post.new(
#     title:Faker::Dog.name,
#     user: User.all.sample
#   )
#   post.image = Rails.root.join(dog).open
#   post.save
# end
250.times do
  Comment.create(
    content:Faker::Hipster.sentence,
    user:User.all.sample,
    post:Post.all.sample
  )
end

1000.times do
  Vote.create(user:User.all.sample, post:Post.all.sample)
end
