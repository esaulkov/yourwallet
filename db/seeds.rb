# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Delete all data
  User.delete_all
  Wallet.delete_all
  Category.delete_all
  Purchase.delete_all
  Transaction.delete_all

  users = User.create([{ name: 'Evgeny Esaulkov', password: 'abracadabra', limit: 20000 }])
 
