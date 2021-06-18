# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Credit.destroy_all
Application.destroy_all
Favour.destroy_all
FavourType.destroy_all
User.destroy_all


# Skills

p plumbing = Skill.find_or_create_by(skill_type: 'Plumbing')

p gardening = Skill.find_or_create_by(skill_type: 'Gardening')

p housekeeping = Skill.find_or_create_by(skill_type: 'Housekeeping')

p accounting = Skill.find_or_create_by(skill_type: 'Accounting')

p clerical = Skill.find_or_create_by(skill_type: 'Clerical')

p painting = Skill.find_or_create_by(skill_type: 'Painting')



# Users

# byebug

p peter = User.new(name: 'Peter', address: '1076 CV Amsterdam, Netherlands', email: 'peter@gmail.com', skills: [plumbing, gardening, clerical])

peter.password = 'qwerty'
file = URI.open('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260')
peter.avatar.attach(io: file, filename: 'Peter.jpg', content_type: 'image/jpg')

peter.save
# p peter.errors.full_messages


p john = User.new(name: 'John', address: '1091 GR Amsterdam, Netherlands', email: 'john@gmail.com', skills: [housekeeping, gardening])
john.password = 'qwerty'
file = URI.open('https://images.pexels.com/photos/3754208/pexels-photo-3754208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
john.avatar.attach(io: file, filename: 'John.jpg', content_type: 'image/jpg')

john.save

p marilou = User.new(name: 'Marilou', address: '1091 GR Amsterdam, Netherlands', email: 'marilou@gmail.com', skills: [housekeeping, gardening])
marilou.password = 'qwerty'
file = URI.open('https://avatars.githubusercontent.com/u/82805747?v=4')
marilou.avatar.attach(io: file, filename: 'marilou.jpg', content_type: 'image/jpg')
marilou.save


p richard = User.new(name: 'Richard', address: '1012 PH Amsterdam, Netherlands', email: 'richard@gmail.com', skills: [accounting, clerical])
richard.password = 'qwerty'
file = URI.open('https://images.pexels.com/photos/5485840/pexels-photo-5485840.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
richard.avatar.attach(io: file, filename: 'Richard.jpg', content_type: 'image/jpg')

richard.save

p nancy = User.new(name: 'Nancy', address: '1016 GV Amsterdam, Netherlands', email: 'nancy@gmail.com', skills: [accounting, clerical, gardening])
file = URI.open('https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260')
nancy.avatar.attach(io: file, filename: 'Nancy.jpg', content_type: 'image/jpg')
nancy.password = 'qwerty'
nancy.save


p sally = User.new(name: 'Sally', address: '1016 GV Amsterdam, Netherlands', email: 'sally@gmail.com', skills: [accounting, clerical, gardening])
file = URI.open('https://images.pexels.com/photos/4926674/pexels-photo-4926674.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
sally.avatar.attach(io: file, filename: 'sally.jpg', content_type: 'image/jpg')
sally.password = 'qwerty'
sally.save

p nirmala = User.new(name: 'Nirmala', address: '1091 Amsterdam, Netherlands', email: 'nirmala@gmail.com', skills: [accounting, clerical, gardening])
file = URI.open('https://avatars.githubusercontent.com/u/79684449?s=400&u=ddd5f9a446f03e0066ce2ed242374f28ec642ff0&v=4')
nirmala.avatar.attach(io: file, filename: 'nirmala.jpg', content_type: 'image/jpg')
nirmala.password = 'qwerty'
nirmala.save





# Favour Types


p plumbing = FavourType.find_or_create_by(content: 'Plumbing', amount_available: 20)
plumbing.save

p gardening = FavourType.find_or_create_by(content: 'Gardening', amount_available: 25)
gardening.save

p financial = FavourType.find_or_create_by(content: 'Financial', amount_available: 30)
financial.save

p clerical = FavourType.find_or_create_by(content: 'Clerical', amount_available: 30)
clerical.save



# Favours



p plumbing_house = Favour.find_or_create_by(duration: '2 hours', description: 'Plumbing all my pipes', zone: '10 RH Amsterdam', user: john, favour_type: plumbing)
file = URI.open('https://www.jgbathrooms.com.au/wp-content/uploads/2020/08/Elanoragibson13.jpg')
plumbing_house.photo.attach(io: file, filename: 'bathroom.jpg', content_type: 'image/jpg')
plumbing_house.save

# plumbing_house.favour_type = plumbing
# plumbing_house.user = john
p plumbing_house.errors.full_messages


p gardening_house = Favour.find_or_create_by(duration: '4 hours', description: 'Tending to my garden', zone: '2011 CH Haarlem, Netherlands', user: peter, favour_type: gardening)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStB0Tsa1IxVbv9jPYyW2FfyDarzAM8jRZQSA&usqp=CAU')
gardening_house.photo.attach(io: file, filename: 'garden.jpg', content_type: 'image/jpg')
gardening_house.save

p tax_returns = Favour.find_or_create_by(duration: '5 hours', description: 'Someone to work on my tax returns', zone: '1012 PH Amsterdam', user: richard, favour_type: financial)
file = URI.open('https://www.aseanbriefing.com/news/wp-content/uploads/2019/10/Personal-Income-Tax-for-Expatriates-in-Indonesia.jpg')
tax_returns.photo.attach(io: file, filename: 'tax.jpg', content_type: 'image/jpg')
tax_returns.save

p admin_work = Favour.find_or_create_by(duration: '2 hours', description: 'A temporary secretary to make my life easier', zone: '1012 PH Amsterdam', user: nancy, favour_type: clerical)
file = URI.open('https://www.aseanbriefing.com/news/wp-content/uploads/2019/10/Personal-Income-Tax-for-Expatriates-in-Indonesia.jpg')
admin_work.photo.attach(io: file, filename: 'admin.jpg', content_type: 'image/jpg')
admin_work.save

p plumbing_work = Favour.find_or_create_by(duration: '2 hours', description: 'Someone to fix my sink in the bathroom', zone: '1012 PH Amsterdam', user: marilou, favour_type: plumbing)
file = URI.open('https://www.jgbathrooms.com.au/wp-content/uploads/2020/08/Elanoragibson13.jpg')
admin_work.photo.attach(io: file, filename: 'plumb.jpg', content_type: 'image/jpg')
admin_work.save

p tax_work = Favour.find_or_create_by(duration: '1 hour', description: 'Please help me with my taxes, new here.', zone: '1012 PH Amsterdam', user: marilou, favour_type: financial)
file = URI.open('https://www.aseanbriefing.com/news/wp-content/uploads/2019/10/Personal-Income-Tax-for-Expatriates-in-Indonesia.jpg')
tax_work.photo.attach(io: file, filename: 'tax_1.jpg', content_type: 'image/jpg')
tax_work.save


# Applications

p application_1 = Application.find_or_create_by(content: 'Would be great to get this task', status: 'accepted', done: 'completed', favour: plumbing_house, user: nancy)
application_1.reviews.create(rating: 5, content: 'A skilled person and friendly')
application_1.reviews.create(rating: 4, content: 'Great person and friendly')
application_1.reviews.create(rating: 5, content: 'Hardworking person')
application_1.save
p application_1.errors.full_messages

p application_2 = Application.find_or_create_by(content: 'Would be great to perform this task. Lots of relevant experience.', status: 'accepted', done: 'completed', favour: gardening_house, user: john)
application_2.reviews.create(rating: 5, content: 'Good job, really reommend.')
application_2.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_2.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_2.save
p application_2.errors.full_messages

p application_3 = Application.find_or_create_by(content: 'Experience of 4 years. Would be great to connect!', status: 'accepted', done: 'completed', favour: plumbing_house, user: peter)
application_3.reviews.create(rating: 3, content: 'Bad work, do not reommend.')
application_3.save
p application_3.errors.full_messages

p application_4 = Application.find_or_create_by(content: 'Experience of 10 years. Would be great to work together!', status: 'accepted', done: 'completed', favour: plumbing_house, user: sally)
application_4.reviews.create(rating: 5, content: 'Good job, really reommend.')
application_4.save
p application_4.errors.full_messages

p application_5 = Application.find_or_create_by(content: 'Experience of 10 years. Would be great to work together!', status: 'accepted', done: 'completed', favour: admin_work, user: richard)
application_5.reviews.create(rating: 5, content: 'Good job, really reommend.')
application_5.reviews.create(rating: 4, content: 'Excellent work, really reommend.')
application_5.save
p application_5.errors.full_messages

p application_6 = Application.find_or_create_by(content: 'Would be great to perform this task. Lots of relevant experience.', status: 'accepted', done: 'completed', favour: gardening_house, user: marilou)
application_6.reviews.create(rating: 4, content: 'Good job, really reommend.')
application_6.reviews.create(rating: 4, content: 'Excellent work, really reommend.')
application_6.reviews.create(rating: 4, content: 'Excellent work, really reommend.')
application_6.save
p application_6.errors.full_messages


p application_7 = Application.find_or_create_by(content: 'I have plumbing skills. I can fix bathrooms & kitchens.', status: 'accepted', done: 'incomplete', favour: plumbing_work, user: peter)
application_7.reviews.create(rating: 5, content: 'Good job, really reommend.')
application_7.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_7.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_7.save
p application_7.errors.full_messages



p application_8 = Application.find_or_create_by(content: 'I am an accountant. I can do taxes.', status: 'pending', done: 'incomplete', favour: tax_work, user: nirmala)
application_8.reviews.create(rating: 5, content: 'Good job, really reommend.')
application_8.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_8.reviews.create(rating: 5, content: 'Excellent work, really reommend.')
application_8.save
p application_8.errors.full_messages



# Credits

p credit_1 = Credit.find_or_create_by(amount_redeemed: 0, user: john)
credit_1.save
p credit_1.errors.full_messages

p credit_2 = Credit.find_or_create_by(amount_redeemed: 10, user: peter)
credit_2.save

p credit_3 = Credit.find_or_create_by(amount_redeemed: 0, user: richard)
credit_3.save

p credit_4 = Credit.find_or_create_by(amount_redeemed: 0, user: nancy)
credit_4.save

p credit_5 = Credit.find_or_create_by(amount_redeemed: 0, user: sally)
credit_5.save
