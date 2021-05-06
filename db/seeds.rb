# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all

100.times do
    created_at = Faker::Date.backward(days:365 * 5)

    Idea.create(
        title: Faker::TvShows::GameOfThrones.character,
        body: Faker::Lorem.sentence(word_count: 55)
    )
end

ideas = Idea.all

puts "Generated #{ideas.count} ideas!"