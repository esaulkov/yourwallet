# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Delete all data
  Transaction.delete_all
  Purchase.delete_all
  User.delete_all
  Wallet.delete_all
  Category.delete_all

  users = User.create([
    { id: 1, name: 'Evgeny Esaulkov', password: 'abracadabra', limit: 20000, email: 'evg.esaulkov@gmail.com' },
    { id: 2, name: 'Max Malyshkin', password: 'abracadabra once again', limit: 50000, email: 'max.malyshkin@gmail.com' }
  ])

  wallets = Wallet.create([
    { :id => 1, :name => 'Наличные', :wallet_type => 1, :balance => 3911.50, :user_id => 1 },
    { :id => 2, :name => 'Карта Сбербанка', :wallet_type => 0, :balance => 20708.49, :user_id => 1 },
    { :id => 3, :name => 'Карта Кукуруза', :wallet_type => 0, :balance => 399.67, :user_id => 1 },
    { :id => 4, :name => '3-литровая банка, зарытая под деревом', :wallet_type => 1, :balance => 60000.00, :user_id => 1 },
    { :id => 5, :name => 'Карта Банка Москвы', :wallet_type => 0, :balance => 120349.49, :user_id => 2 }
  ])
  
  categories = Category.create([
    { :id => 1, :name => 'Продукты', :user_id => 1 },
    { :id => 2, :name => 'Кафе/рестораны', :user_id => 1 },
    { :id => 3, :name => 'Перевод средств', :user_id => 1 },
    { :id => 4, :name => 'Бытовые товары', :user_id => 1 },
    { :id => 5, :name => 'Кафе/рестораны', :user_id => 2 }
  ])
  
  purchases = Purchase.create([
    { :id => 1, :name => 'Косметика', :category_id => 4 },
    { :id => 2, :name => 'Перевод с карты сбербанка на карту Кукуруза', :category_id => 3 },
    { :id => 3, :name => 'Кофе (кафе "Нон-Стоп")', :category_id => 2 },
    { :id => 4, :name => 'Продукты (м-н "Мария-Ра")', :category_id => 1 },
    { :id => 5, :name => 'Продукты (м-н "Техномир")', :category_id => 1 },
    { :id => 6, :name => 'Помощь брату', :category_id => 3 },
    { :id => 7, :name => 'Обед (ресторан "New science")', :category_id => 6 }
  ])
  
  transactions = Transaction.create([
    { :id => 1, :sum => -527.30, :date_time => '2015-06-01T10:30:07+07:00', :wallet_id => 2, :purchase_id => 1 },
    { :id => 2, :sum => -5000.00, :date_time => '2015-06-01T11:15:00+07:00', :wallet_id => 2, :purchase_id => 2 },
    { :id => 3, :sum => 5000.00, :date_time => '2015-06-01T11:15:00+07:00', :wallet_id => 3, :purchase_id => 2 },
    { :id => 4, :sum => -67.50, :date_time => '2015-06-01T12:22:48+07:00', :wallet_id => 1, :purchase_id => 3 },
    { :id => 5, :sum => -921.44, :date_time => '2015-06-02T16:37:52+07:00', :wallet_id => 3, :purchase_id => 4 },
    { :id => 6, :sum => -58.00, :date_time => '2015-06-03T11:52:08+07:00', :wallet_id => 1, :purchase_id => 3 },
    { :id => 7, :sum => -434.75, :date_time => '2015-06-03T13:04:30+07:00', :wallet_id => 3, :purchase_id => 5 },
    { :id => 8, :sum => -15000.00, :date_time => '2015-06-03T16:05:00+07:00', :wallet_id => 4, :purchase_id => 6 },
    { :id => 10, :sum => -1500.00, :date_time => '2015-06-03T16:05:00+07:00', :wallet_id => 5, :purchase_id => 7 }
  ])

 
