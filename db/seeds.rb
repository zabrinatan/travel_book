# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create :email => 'craigsy@ga.co', :password => 'chicken'
u2 = User.create :email => 'jonesy@ga.co', :password => 'chicken'

Location.destroy_all

l1 = Location.create :address => 'Sydney, Australia', :latitude => -33.8688197, :longitude => 151.2092955
l2 = Location.create :address => 'Bali, Indonesia', :latitude => -8.4095178, :longitude => 115.188916

Dashboard.destroy_all

d1 = Dashboard.create :user_id => 1, :name => 'Australian Tour'
