# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

# Create a default user

user = User.create(
  email: "admin@admin.com",
  name: "Marcelo Candido",
  password: "123456",
  password_confirmation: "123456",
  access: "admin"
)

user.photo.attach(io: File.open("app/assets/images/avatar.jpg"), filename: "avatar.jpg")
user.save!

puts "Default user created"

# Create posts
5.times do |i|
 post = Post.new(
    title: Faker::Lorem.sentence(word_count: 3),
    subtitle: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.paragraph(sentence_count: 10),
    user_id: 1
 )
  post.banner.attach(io: File.open("app/assets/images/banner#{i + 1}.jpg"), filename: "banner#{i + 1}.jpg")
  post.save!
end

puts "Posts created"

# create tags
["Filmes", "Séries", "Animes", "Games"].each do |tag_name|
  Tag.find_or_create_by!(title: tag_name)
end

puts "Tags created"
