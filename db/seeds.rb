# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher = Publisher.create(name: 'westinghouse')
publisher.books.create(title: '1984')
shop = Shop.create(name: 'amazon')
publisher.books.last.shop_books.create(shop: shop, copies_in_stock: 3)