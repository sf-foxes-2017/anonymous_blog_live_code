Entry.destroy_all
Tag.destroy_all

10.times do
  Entry.create(title: Faker::Cat.registry, body: Faker::ChuckNorris.fact)

  Tag.create(name: Faker::Color.color_name)
end

Entry.all.each do |entry|
  entry.tags = Tag.all.sample(3)
end