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

l1 = Location.create :address => 'Sydney, Australia', :latitude => -33.8688197, :longitude => 151.2092955, :image =>"https://farm4.staticflickr.com/3793/12186561576_0a7bd2368b_n.jpg"
l2 = Location.create :address => 'Bali, Indonesia', :latitude => -8.4095178, :longitude => 115.188916, :image => "https://farm4.staticflickr.com/3782/13940226364_f3f5c947ae_n.jpg"
l3 = Location.create :address => 'Perth, Australia', :longitude => "115.8604572", :latitude => "-31.9505269", :image => " https://farm5.staticflickr.com/4231/35486487246_1af0ec56d1_n.jpg"

Dashboard.destroy_all

d1 = Dashboard.create :user_id => 1, :name => 'Australian Tour'
d1 = Dashboard.create :user_id => 1, :name => '2019 Travel Locations'
