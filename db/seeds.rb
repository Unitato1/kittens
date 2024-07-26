# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

names = ["Felix", "Garfild", "Tina","Puss in boots"]
values = [420, 42, 999, 100000000, 9, 6]

names.each do |name|
  Kitten.create!(name: name, age: rand(1..15), cuteness: values.sample, softness: values.sample)
end
