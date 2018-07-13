# == Schema Information
#
# Table name: dashboards
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  user_id     :integer
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dashboard < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :locations
end
