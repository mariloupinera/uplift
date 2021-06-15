# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Credit.destroy_all
Application.destroy_all
Favour.destroy_all
FavourType.destroy_all
User.destroy_all


# Skills

p plumbing = Skill.find_or_create_by(skill_type: 'plumbing')

p gardening = Skill.find_or_create_by(skill_type: 'gardening')

p housekeeping = Skill.find_or_create_by(skill_type: 'housekeeping')

p accounting = Skill.find_or_create_by(skill_type: 'accounting')

p clerical = Skill.find_or_create_by(skill_type: 'clerical')



# Users

# byebug
p peter = User.new(name: 'Peter', address: '123 Street', email: 'peter@gmail.com', skills: [plumbing, gardening, clerical])
peter.password = 'qwerty'
peter.save
# p peter.errors.full_messages


p john = User.new(name: 'John', address: '124 Lane', email: 'john@gmail.com', skills: [housekeeping, gardening])
john.password = 'qwerty'
john.save

p richard = User.new(name: 'Richard', address: '124 Lane', email: 'richard@gmail.com', skills: [accounting, clerical])
richard.password = 'qwerty'
richard.save

p pierre = User.new(name: 'Pierre', address: '124 Tiny Lane', email: 'pierre@gmail.com', skills: [accounting, clerical, gardening])
pierre.password = 'qwerty'
pierre.save



# Favour Types


p plumbing = FavourType.find_or_create_by(content: 'plumbing', amount_available: 20)
plumbing.save

p gardening = FavourType.find_or_create_by(content: 'gardening', amount_available: 25)
gardening.save

p financial = FavourType.find_or_create_by(content: 'financial', amount_available: 30)
financial.save

p clerical = FavourType.find_or_create_by(content: 'clerical', amount_available: 30)
clerical.save



# Favours



p plumbing_house = Favour.find_or_create_by(duration: 'one day', description: 'plumbing all my pipes', zone: 'Central', user: john, favour_type: plumbing)
plumbing_house.save

# plumbing_house.favour_type = plumbing
# plumbing_house.user = john
p plumbing_house.errors.full_messages


p gardening_house = Favour.find_or_create_by(duration: 'one day', description: 'tending to my garden', zone: 'West', user: peter, favour_type: gardening)
gardening_house.save

p tax_returns = Favour.find_or_create_by(duration: 'one week', description: 'Someone to work on my tax returns', zone: 'West', user: richard, favour_type: financial)
tax_returns.save

p admin_work = Favour.find_or_create_by(duration: 'one week', description: 'A temporary secretary to make my life easier', zone: 'West', user: pierre, favour_type: clerical)
admin_work.save





# Applications

p application_1 = Application.find_or_create_by(content: 'Would be great to get this task', status: 'accepted', done: 'completed', favour: plumbing_house, user: peter)
application_1.save
p application_1.errors.full_messages

p application_2 = Application.find_or_create_by(content: 'Would be great to perform this task. Lots of relevant experience.', status: 'pending', done: 'incomplete', favour: gardening_house, user: john)
application_2.save
p application_2.errors.full_messages

p application_3 = Application.find_or_create_by(content: 'Experience of 4 years. Would be great to connect!', status: 'declined', done: 'incomplete', favour: plumbing_house, user: peter)
application_3.save
p application_3.errors.full_messages

p application_4 = Application.find_or_create_by(content: 'Experience of 10 years. Would be great to work together!', status: 'declined', done: 'incomplete', favour: plumbing_house, user: peter)
application_4.save
p application_4.errors.full_messages
p application_4.errors.full_messages

p application_5 = Application.find_or_create_by(content: 'Experience of 10 years. Would be great to work together!', status: 'accepted', done: 'completed', favour: admin_work, user: peter)
application_5.save


# Credits

p credit_1 = Credit.find_or_create_by(amount_redeemed: 0, user: john)
credit_1.save
p credit_1.errors.full_messages

p credit_2 = Credit.find_or_create_by(amount_redeemed: 10, user: peter)
credit_2.save

p credit_3 = Credit.find_or_create_by(amount_redeemed: 0, user: richard)
credit_3.save

p credit_4 = Credit.find_or_create_by(amount_redeemed: 0, user: pierre)
credit_4.save


