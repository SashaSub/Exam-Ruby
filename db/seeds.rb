# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# !!! El administrador agrega los usuarios como Clientes. !!!
# !!! Tiene que registrarse primero y luego el administrador debe agregarle como cliente. !!!

    User.create!(email:"admin@gmail.com", password:"123456", name:"Admin", role:"admin")
    User.create!(email:"user1@gmail.com", password:"123456", name:"User 1")
    User.create!(email:"user2@gmail.com", password:"123456", name:"User 2")
    User.create!(email:"user3@gmail.com", password:"123456", name:"User 3")
    User.create!(email:"user4@gmail.com", password:"123456", name:"User 4")

    20.times do
    Product.create!([
      { nombre: Faker::Commerce.product_name, precio: Faker::Commerce.price, descripcion: Faker::Lorem.paragraph(sentence_count: 2), cantidad: rand(100)}
    ])
    end

    Payment.create!(nombre: "Efectivo")
    Payment.create!(nombre: "Crédito")
    Payment.create!(nombre: "Débito")  

    Type.create!(nombre: "Minorista")
    Type.create!(nombre: "Mayorista")