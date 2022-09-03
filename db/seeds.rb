# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

15.times do
    rand_section_id = rand(15)
    Section.create(name: Faker::Commerce.department(max: 1, fixed_amount: true), parent_id: (rand_section_id < Section.count ? rand_section_id : 0))
end

section_ids = Section.ids
100.times do 
    Book.create(name: Faker::Commerce.product_name,
                section_id: section_ids.sample,
                description: Faker::Books::Dune.saying)
end