# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# db/seeds.rb

# Ensure that the admin account is created if it doesn't exist
user_email = 'jayram.celinscak@scv.si'
user_password = ENV['ADMIN_PASSWORD']  # Make sure to change this for production

User.find_or_create_by!(email: user_email) do |user|
    user.password = user_password
  user.password_confirmation = user_password
  user.admin = true
end

categories = [
  "Elektronika",
  "Oblačila in obutev",
  "Pohištvo",
  "Avtomobili in prevozna sredstva",
  "Otroci in igrače"
]

# Poskrbimo, da so kategorije ustvarjene, če še ne obstajajo
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

