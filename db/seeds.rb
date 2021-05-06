# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
User.destroy_all
Review.destroy_all
Like.destroy_all

PASSWORD = 'supersecret'
10.times do 
    first_name= Faker:: Name.first_name
    last_name= Faker::Name.last_name
    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@example.com",
    password: PASSWORD
    )
  end
  users = User.all

100.times do
    created_at = Faker::Date.backward(days:365 * 5)

    i = Idea.create(
        title: Faker::TvShows::GameOfThrones.character,
        body: Faker::Lorem.sentence(word_count: 55),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    if i.persisted?
        i.reviews = rand(1..10).times.map do
            Review.new(body: Faker::GreekPhilosophers.quote, user: users.sample)
        end
        i.likers = users.shuffle.slice(0, rand(users.count))
    end
end

ideas = Idea.all
reviews = Review.all
likes = Like.all

puts "Generated #{ideas.count} ideas!"
puts "Generated #{users.count} users!"
puts "Generated #{reviews.count} reviews!"
puts "Generated #{likes.count} reviews!"