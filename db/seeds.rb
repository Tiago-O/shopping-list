# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting users, lists & items'
Item.destroy_all
List.destroy_all
User.destroy_all

puts 'Creating users: Tiago and Manuel'
tiago = User.create(name: 'Tiago', email: 'tiago@me.pt', password: '123456')
manuel = User.create(name: 'Manuel', email: 'manuel@me.pt', password: '123456')

puts "created #{User.count} users"

puts 'Creating lists'
fruits = List.create(user: tiago, title: 'Fruit')
candy = List.create(user: tiago, title: 'Candy')
vegetables = List.create(user: tiago, title: 'Vegetables')

fish = List.create(user: manuel, title: 'Fish')

puts "created #{List.count} lists"

puts 'Creating items'

Item.create(list: fruits, name: 'apple', quantity: 5)
Item.create(list: fruits, name: 'banana', quantity: 3)
Item.create(list: fruits, name: 'figs', quantity: 10)

Item.create(list: candy, name: 'chocolate', quantity: 1)
Item.create(list: candy, name: 'caramels', quantity: 40)
Item.create(list: candy, name: 'gummies', quantity: 30)

Item.create(list: vegetables, name: 'lettuce', quantity: 1)
Item.create(list: vegetables, name: 'pumpkin', quantity: 2)
Item.create(list: vegetables, name: 'potato', quantity: 3)

Item.create(list: fish, name: 'salmon', quantity: 1)
Item.create(list: fish, name: 'sardines', quantity: 4)
Item.create(list: fish, name: 'trout', quantity: 2)

puts "Created #{Item.count} items"

puts 'seeds created'
