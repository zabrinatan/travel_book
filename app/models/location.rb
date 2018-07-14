# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  address    :text
#  longitude  :float
#  latitude   :float
#  api_id     :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if :address_changed?
  has_and_belongs_to_many :dashboards
  has_many :users, :through => :dashboard
end
end
