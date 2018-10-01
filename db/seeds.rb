# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
dogs = ["00186969-c51d-462b-948b-30a7e1735908.jpg","00564ba3-e5cb-4b2b-8d97-c65a9ef26c23.png","00b417af-0b5f-42d7-9ad0-6aab6c3db491.jpg","01289c3d-5668-45b9-8c32-42eb9135e04c.mp4","027eef85-ccc1-4a66-8967-5d74f34c8bb4.jpg","03024628-188b-408e-a853-d97c9f04f903.jpg","037c01a0-99b3-4757-90b5-04df9be427a6.JPG","0415ca3e-0e99-4afa-bec6-bd8a4a7ff6ff.PNG","046e5758-d1ef-436f-b7e2-530134562445.jpg","054800b7-4ed5-411e-bca2-c06e8404a3d2.mp4","054dce82-51c9-49d5-bc7c-4d76e8288d33.jpg","0597fcdd-871c-487e-a62f-b3cab8937fda.mp4","05f4b372-d8ff-42f0-8c11-b78c45d9eaa1.jpg","062013b4-8bad-4a6a-a69c-e4de7fdd86d8.jpg","064e72d5-9932-45f3-92a8-5e36b8da7b8a.mp4","068fc183-d4e3-4780-b01c-6cce0d019d13.jpg","06c96920-38c5-4883-95ac-0968a4ecd4f1.JPG","06ec5d00-6da0-46cb-ab4a-f6ea1e6a461f.gif","070e5640-e656-45ca-a7d5-b8cc23098252.mp4","075bfcba-f13c-43a9-983c-740bcce9d876.png","07688b1f-08ee-46f2-b475-19446a9bbcb4.jpg","07c4e089-a7da-430a-ac09-a0da419efefa.JPG","07e51206-2967-4632-ad03-a7f12675bc55.jpg"]

10.times do
  password = Faker::Internet.password
  User.create(
    username:Faker::Internet.username,
    email:Faker::Internet.email,
    password:password,
    password_confirmation:password
    )
end

50.times do
  Post.create(
    title:Faker::Dog.meme_phrase,
    image:"http://random.dog/#{dogs.sample}",
    user: User.all.sample
  )
end
