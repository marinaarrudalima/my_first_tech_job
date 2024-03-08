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
Candidate.destroy_all
# image = ActionController::Base.helpers.asset_path("ganza.jpg")
image = File.open(Rails.root.join('app', 'assets', 'images', 'ganza.jpg'))
puts "esta é a #{image}"

user = User.create!(email: "jane.doe@mail.com", password: "123123")
Candidate.create!(
  first_name: "Jane",
  last_name: "Doe",
  address: "123 Main St, Anytown, USA",
  nationality: "American",
  gender: "Female",
  birth_date: Date.new(1990, 3, 1),
  photo: image,
  summary: "A passionate developer...",
  tech_interest: "Web development",
  tech_languages: "Ruby, JavaScript",
  preferred_companies: "GitHub, Google",
  cv_upload: nil,
  terms_conditions: "true",
  user: user)
