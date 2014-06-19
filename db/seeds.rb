# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

5.times do
  users << User.create(name: Faker::Name.name)
end

10.times do
  post = Post.create(title: Faker::Company.catch_phrase,
              body: Faker::Lorem.paragraph(rand(1..5)),
              user: users.sample)
  post.published_at = (DateTime.now - rand(1..5).months - rand(1..10).hours)
  post.save
end

