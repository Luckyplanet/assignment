# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  SecretCode.create!
end

u = User.create!(email: 'admin@email.com', password: '123456', selected_secret_code: SecretCode.first.id)

role = Role.create!(role_name: 'admin')

UserRole.create!(user_id: u.id, role_id: role.id)

