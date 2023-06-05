20.times do
  Kittens.create!(
    name: Faker::Name.first_name,
    description: Faker::Lorem.sentence,
    price: rand(5..1000)
    image_url: Faker::LoremFlickr.image(size: "5x5", search_terms: ['kitten'])
  )
end