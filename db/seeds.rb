# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def add_users
  User.create(
    phone_number: '12345',
    first_name: 'John',
    last_name: 'Doe',
    password: 'password',
    password_confirmation: 'password',
    email: 'test@example.com'
  )
end

def add_cars
  cars = [
    {
      make: 'Toyota',
      model: 'Corolla',
      year: 2019
    },
    {
      make: 'Toyota',
      model: 'Camry',
      year: 2018
    },
    {
      make: 'Toyota',
      model: 'Rav4',
      year: 2017
    },
    {
      make: 'Toyota',
      model: 'Corolla',
      year: 2020
    }
  ]

  Car.create(cars)
end

add_users
add_cars
