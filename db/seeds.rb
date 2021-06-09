# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

# Skills

p plumbing = Skill.find_or_create_by(skill_type: 'plumbing')

p gardening = Skill.find_or_create_by(skill_type: 'gardening')

p housekeeping = Skill.find_or_create_by(skill_type: 'housekeeping')





# Users

# byebug
p peter = User.new(name: 'Peter', address: '123 Street', email: 'peter@gmail.com', skills: [plumbing, gardening])
peter.password = 'qwerty'
peter.save
# p peter.errors.full_messages


p john = User.new(name: 'John', address: '124 Lane', email: 'john@gmail.com', skills: [housekeeping, gardening])
john.password = 'qwerty'
john.save



# Favour Types


p plumbing = FavourType.find_or_create_by(content: 'plumbing')
plumbing.save

p gardening = FavourType.find_or_create_by(content: 'gardening')
gardening.save



# Favours



p plumbing_house = Favour.find_or_create_by(duration: 'one day', description: 'plumbing all my pipes', zone: 'Central', user: john, favour_type: plumbing)
plumbing_house.save

# plumbing_house.favour_type = plumbing
# plumbing_house.user = john
p plumbing_house.errors.full_messages


p gardening_house = Favour.find_or_create_by(duration: 'one day', description: 'tending to my garden', zone: 'West', user: peter, favour_type: gardening)
gardening_house.save





# Applications

p application_1 = Application.find_or_create_by(content: 'Would be great to get this task', status: 'accepted', done: 'completed', favour: plumbing_house, user: john)
application_1.save
p application_1.errors.full_messages

p application_2 = Application.find_or_create_by(content: 'Would be great to perform this task. Lots of relevant experience.', status: 'pending', done: 'incomplete', favour: gardening_house, user: peter)
application_2.save

p application_3 = Application.find_or_create_by(content: 'Experience of 4 years. Would be great to connect!', status: 'declined', done: 'incomplete', favour: plumbing_house, user: peter)
application_3.save

p application_4 = Application.find_or_create_by(content: 'Experience of 10 years. Would be great to work together!', status: 'declined', done: 'completed', favour: plumbing_house, user: john)
application_4.save
p application_4.errors.full_messages




# Credits

p credit_1 = Credit.find_or_create_by(amount_available: 20, amount_redeemed: 0, balance: 20, application: application_1, favour: plumbing_house)
credit_1.save
p credit_1.errors.full_messages

p credit_2 = Credit.find_or_create_by(amount_available: 30, amount_redeemed: 10, balance: 20, application: application_2, favour: gardening_house)
credit_2.save

p credit_3 = Credit.find_or_create_by(amount_available: 0, amount_redeemed: 0, balance: 0, application: application_3, favour: gardening_house)
credit_3.save


