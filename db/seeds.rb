# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  number = (0..5).to_a.sample
  Product.create!(name:Faker::Appliance.equipment, price:(1000..10000).to_a.sample ,
                  description:Faker::Lorem.paragraph , quantity:number,
                  status: number.zero? ? 1 : 0)
end

User.create!(first_name: 'Admin', last_name: 'Admin', email: 'admin@admin.admin' , password: 'admin' , admin: true)
