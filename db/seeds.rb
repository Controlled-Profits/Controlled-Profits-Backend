# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(firstname: 'Test', lastname: 'User', email: 'test@aol.com', password: 'Password123', password_confirmation: 'Password123')

Business.create(user_id: 1, name: 'Test Business', naics: '00000', sic: '0000', ein: '79-7979797')

Income.create(business_id: 1, period_sales: 100000, cash_collections: 50000, credit_sales: 25000, entry_date: DateTime.parse('2017-08-29 18:22:44.670Z'))