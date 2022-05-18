# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all
10.times do
    r = Restaurant.create!(
        name: Faker::Restaurant.name,
        address: Faker::Address.city,
        phone_number: Faker::PhoneNumber.cell_phone,
        category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )

    rand(1..5).times do
        Review.create!(
            content: Faker::Lorem.sentence,
            rating: rand(0..5),
            restaurant: r
        )
    end
end