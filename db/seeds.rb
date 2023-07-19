# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

20.times do
    Product.create!([
      { nombre: Faker::Commerce.product_name, precio: Faker::Commerce.price, descripcion: Faker::Lorem.paragraph(sentence_count: 2), cantidad: rand(100)}
    ])
  end

# !!! No usar para crear Clientes. Tiene que registrarse primero y luego el administrador debe agregarle como cliente. !!!

#   10.times do
#     Client.create!([
#       { nombre: Faker::Name.name, email: Faker::Internet.email, type_id: rand(1..2)}
#     ])
#   end

  Payment.create!(nombre: "Efectivo")
  Payment.create!(nombre: "Crédito")
  Payment.create!(nombre: "Débito")  

  Type.create!(nombre: "Minorista")
  Type.create!(nombre: "Mayorista")