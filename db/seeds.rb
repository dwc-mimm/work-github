# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@example.com",
             password:  "11111111",
             password_confirmation: "11111111")


Genre.create!(name: "ケーキ")

Genre.create!(name: "プリン")

Genre.create!(name: "焼き菓子")

Genre.create!(name: "キャンディ")


Product.create!(name: "イチゴのホールケーキ",
                description: "美味しい",
                tax_excluded_price: "1000",
                genre_id: 1,
                sale_status: true,
                image: File.open("./app/assets/images/cake-1.jpg"))

Product.create!(name: "チョコケーキ",
                description: "美味しい",
                tax_excluded_price: "1500",
                genre_id: 1,
                sale_status: true,
                image: File.open("./app/assets/images/cake-2.jpg"))

Product.create!(name: "イチゴチョコケーキ",
                description: "美味しい",
                tax_excluded_price: "900",
                genre_id: 1,
                sale_status: true,
                image: File.open("./app/assets/images/cake-3.jpg"))

Product.create!(name: "ベリーケーキ",
                description: "美味しい",
                tax_excluded_price: "2000",
                genre_id: 1,
                sale_status: true,
                image: File.open("./app/assets/images/cake-4.jpg"))

Product.create!(name: "チョコベリーケーキ",
                description: "美味しい",
                tax_excluded_price: "2500",
                genre_id: 1,
                sale_status: true,
                image: File.open("./app/assets/images/cake-5.jpg"))

Product.create!(name: "ベリープリン",
                description: "美味しい",
                tax_excluded_price: "500",
                genre_id: 2,
                sale_status: true,
                image: File.open("./app/assets/images/puding-1.jpg"))

Product.create!(name: "チョコベリープリン",
                description: "美味しい",
                tax_excluded_price: "800",
                genre_id: 2,
                sale_status: true,
                image: File.open("./app/assets/images/puding-2.jpg"))

Product.create!(name: "エンゼルドーナツ",
                description: "美味しい",
                tax_excluded_price: "400",
                genre_id: 3,
                sale_status: true,
                image: File.open("./app/assets/images/bake-1.jpg"))

Product.create!(name: "マカロン詰め合わせ",
                description: "美味しい",
                tax_excluded_price: "2500",
                genre_id: 3,
                sale_status: true,
                image: File.open("./app/assets/images/bake-2.jpg"))

Product.create!(name: "色とりどりキャンディ",
                description: "美味しい",
                tax_excluded_price: "1000",
                genre_id: 4,
                sale_status: true,
                image: File.open("./app/assets/images/candy-1.jpg"))

Product.create!(name: "キャンディ詰め合わせ",
                description: "美味しい",
                tax_excluded_price: "2000",
                genre_id: 4,
                sale_status: true,
                image: File.open("./app/assets/images/candy-2.jpg"))


