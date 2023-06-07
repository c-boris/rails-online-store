require 'uri'

CHAT_KEYWORDS = ['kitten', 'cat', 'katua', 'chat', 'kitty', 'chaton', 'paws', 'whiskers', 'miaou', 'purr', 'gato', 'gata', 'katze', 'yeowl', 'meowing', 'con_mèo', 'meows', 'pisică', 'macska', 'gat']

NUM_ITEMS = CHAT_KEYWORDS.length

NUM_ITEMS.times do
  random_index = rand(CHAT_KEYWORDS.length)
  random_keyword = CHAT_KEYWORDS[random_index]
  CHAT_KEYWORDS.delete_at(random_index)

  encoded_keyword = URI.encode_www_form_component(random_keyword)
  item_image = Faker::LoremFlickr.image(
    size: "450x450",
    search_terms: [encoded_keyword]
  )

  item = Item.new(
    title: Faker::Name.first_name,
    description: Faker::Lorem.sentence,
    price: rand(50..999.99)
  )

  item.item_picture.attach(io: URI.open(item_image), filename: 'image.jpg')

  item.save!
end
