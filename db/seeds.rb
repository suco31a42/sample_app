# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
  { name: '田中ゆうこ', age: 24, height: 155, weight: 40, gender: '女' },
  { name: '森山太郎', age: 26, height: 167, weight: 60, gender: '男' },
  { name: '山田太郎', age: 34, height: 175, weight: 74, gender: '男' },
  { name: '秋山なお', age: 18, height: 160, weight: 46, gender: '女' }
]
User.create(users)