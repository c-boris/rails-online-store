KEYWORDS = ['kitten', 'cat', 'katua', 'chat', 'kitty', 'chaton', 'paws', 'whiskers', 'miaou', 'purr', 'gato', 'gata', 'katze', 'yeowl', 'gatto', 'con_mèo', 'kat', 'pisică', 'macska', 'gat']

NUM_ITEMS = KEYWORDS.length

NUM_ITEMS.times do
  random_index = rand(KEYWORDS.length)
  random_keyword = KEYWORDS[random_index]
  KEYWORDS.delete_at(random_index)

  item_image = Faker::LoremFlickr.image(
    size: "450x450",
    search_terms: [random_keyword]
  )

  Item.create!(
    title: Faker::Name.first_name,
    description: Faker::Lorem.sentence,
    price: rand(50..999.99),
    image_url: item_image
  )
end
