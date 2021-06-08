# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

p plumbing = Skill.find_or_create_by(skill_type: 'plumbing')

p gardening = Skill.find_or_create_by(skill_type: 'gardening')


p housekeeping = Skill.find_or_create_by(skill_type: 'housekeeping')

byebug
p peter = User.new(name: 'Peter', address: '123 Street', email: 'peter@gmail.com', skills: [plumbing, gardening])
peter.password = 'qwerty'
peter.save
p peter.errors.full_messages


p john = User.new(name: 'John', address: '124 Lane', email: 'john@gmail.com', skills: [housekeeping, gardening])
john.password = 'qwerty'
john.save


p plumbing = FavourType.find_or_create_by(content: 'plumbing')


p plumbing_house = Favour.find_or_create_by(duration: 'one day', description: 'plumbing all my pipes', zone: '1 km away')
p plumbing_house.errors.full_messages


p gardening_house = Favour.find_or_create_by(duration: 'one day', description: 'tending to my garden', zone: '1 km away')


# application = Application.find_or_create_by

