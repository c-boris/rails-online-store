NUM_ITEMS = 20
NUM_KITTEN_IMAGES = 40
MIN_SIZE = 450
MAX_SIZE = 550

# Générer les 40 images et les stocker dans un tableau
kitten_images = []
NUM_KITTEN_IMAGES.times do
  kitten_images << Faker::LoremFlickr.image(size: "#{rand(MIN_SIZE..MAX_SIZE)}x#{rand(MIN_SIZE..MAX_SIZE)}", search_terms: ['kitten'])
end

NUM_ITEMS.times do
  random_index = rand(NUM_KITTEN_IMAGES)  # Générer un index aléatoire pour accéder à une image dans le tableau
  item_image = kitten_images[random_index]

  Item.create!(
    title: Faker::Name.first_name,
    description: Faker::Lorem.sentence,
    price: rand(5.00..1000.00),
    image_url: item_image
  )
end