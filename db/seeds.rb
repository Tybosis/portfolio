# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

editor = User.create!(role: 'editor', email: "email2@website.com", password: '1234fake')
author = User.create!(role: 'author', email: "author@website.com", password: '1234fake')

5.times do |x|
Article.create!(title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
                content: Faker::Hacker.say_something_smart, published: true,
                author: editor)
end

5.times do |x|
Article.create!(title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
                content: Faker::Hacker.say_something_smart, published: false,
                author: editor)
end

5.times do |x|
Article.create!(title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
                content: Faker::Hacker.say_something_smart, published: false,
                author: author)
end
