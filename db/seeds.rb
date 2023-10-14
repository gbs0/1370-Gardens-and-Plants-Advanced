if Rails.env.development?
  Garden.destroy_all
  Tag.destroy_all

  Garden.create!(
    name: "My Little Garden",
    banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
  )

  Garden.create!(
    name: "My Other Garden",
    banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
  )

  Tag.categories.each do |tag|
    Tag.create!(name: tag)
  end
end
