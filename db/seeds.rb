# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destruyendo datos"
Category.destroy_all
Console.destroy_all
Rent.destroy_all
Game.destroy_all
User.destroy_all

puts "Creando categorías..."
shooter = Category.create!(category: "shooter")
survival= Category.create!(category: "survival")
sandbox = Category.create!(category: "sandbox")
horror = Category.create!(category: "horror")
strategy = Category.create!(category: "strategy")
multiplayer = Category.create!(category: "multiplayer")
puts "Creando consolas..."
pc = Console.create!(console: "pc")
ps2 = Console.create!(console: "ps2")
ps3 = Console.create!(console: "ps3")
ps4 = Console.create!(console: "ps4")
ps5 = Console.create!(console: "ps5")
xbox = Console.create!(console: "xbox")
xboxOne = Console.create!(console: "xboxOne")
nintendo_switch = Console.create!(console: "nintendo switch")

puts "Creando usuarios..."

user1 = User.create!(email: "hernan@gmail.com", password: "12345612778")
user2 = User.create!(email: "christian@gmail.com", password: "1234125678")
user3 = User.create!(email: "andres@gmail.com", password: "12342156")
user4 = User.create!(email: "tomas@gmail.com", password: "12345126")
puts "Fin de las creaciones"

puts "Creando juegos..."
minecraft = Game.create!(name: "minecraft", price: 17, description: "more than a cave game", user_id: user3.id, category_id: sandbox.id, console_id: pc.id, img_url: "minecraft.jpg")
Game.create!(name: "roblox", price: 1, description: "worst game ever", user_id: user3.id, category_id: sandbox.id, console_id: nintendo_switch.id, img_url: "roblox.jpg")
Game.create!(name: "outlast", price: 25, description: "creepy", user_id: user1.id, category_id: horror.id, console_id: pc.id, img_url: "outlast.jpg")
Game.create!(name: "far cry 4", price: 45, description: "I hate Pagan Min", user_id: user1.id, category_id: shooter.id, console_id: ps4.id, img_url: "farcry4.jpg")
Game.create!(name: "age of empires IV", price: 40, description: "Very fun", user_id: user2.id, category_id: strategy.id, console_id: pc.id, img_url: "age-of-empires-4.jpg")
fifa2022 = Game.create!(name: "fifa2022", price: 5, description: "football game", user_id: user4.id, category_id: multiplayer.id, console_id: ps5.id, img_url: "fifa2022.jpeg")

puts "Creando rentas..."

Rent.create!(start_date: "2022/01/01", end_date: "2022/02/01", price: 17, game_id: minecraft.id, user_id: user1.id)
Rent.create!(start_date: "2022/02/02", end_date: "2022/03/03", price: 17, game_id: minecraft.id, user_id: user2.id)
Rent.create!(start_date: "2022/01/01", end_date: "2022/02/01", price: 17, game_id: fifa2022.id, user_id: user2.id)
Rent.create!(start_date: "2022/01/01", end_date: "2022/02/01", price: 17, game_id: fifa2022.id, user_id: user3.id)

puts "Creaciones terminadas."
