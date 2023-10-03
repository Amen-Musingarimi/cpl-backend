# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

super_admin = User.create!(
  name: 'Amen',
  surname: 'Musingarimi',
  email: 'takudzwamusinga@gmail.com',
  date_of_birth: '11-02-1995',
  password: 'Takudzwa95!',
  national_id_number: '45-209926Y22',
  team: 'Ligi Mabelreign',
  phone_number: '0712539755',
  team_role: 'system_admin'
)

puts "Super Admin created with email: #{super_admin.email}"

