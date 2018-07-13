# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  lng        :integer
#  lat        :integer
#  api_id     :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_and_belongs_to_many :dashboards
  has_many :users, :through => :dashboard
end
