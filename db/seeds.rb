# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  [
    {
      name: '野村優登',
      email: 'yuto@gmail.com',
      password: 'password',
      address: '愛知県名古屋市'
    },
    {
      name: 'めんま',
      email: 'menma@gmail.com',
      password: 'password',
      address: '愛知県名古屋市'
    }
  ]
)
Item.create!(
  [
    {
      title: 'ラクロス棒',
      price: 4000,
      description: '丈夫にできています',
      user: User.find(1),
      is_sold: true,
      item_status: 0,
      delivery_fee: 0,
      delivery_day: 0
    },
    {
      title: 'ラクロス棒２',
      price: 4000,
      description: '丈夫にできています',
      user: User.find(1),
      is_sold: true,
      item_status: 0,
      delivery_fee: 0,
      delivery_day: 0
    },
    {
      title: 'ラクロス銀色の棒',
      price: 4000,
      description: '丈夫にできています',
      user: User.find(2),
      is_sold: true,
      item_status: 0,
      delivery_fee: 0,
      delivery_day: 0
    },
    {
      title: 'ラクロス黄金の棒',
      price: 4000,
      description: '火が出るようにできています',
      user: User.find(2),
      is_sold: true,
      item_status: 0,
      delivery_fee: 0,
      delivery_day: 0
    }
  ]
)
Order.create!(
  [
    {
      buyer: User.find(1),
      seller: Item.find(2).user,
      item: Item.find(2)
    },
    {
      buyer: User.find(2),
      seller: Item.find(1).user,
      item: Item.find(1)
    }
  ]
)
