20.times do
  Item.create!(
    title: Faker::Name.first_name,
    description: Faker::Lorem.sentence,
    price: rand(5.00..1000.00),
    image_url: Faker::LoremFlickr.image(size: "500x500", search_terms: ['kitten'])
  )
end