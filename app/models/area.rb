# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ApplicationRecord
	has_many :careers
	
	validates :name, presence: true, uniqueness: true
end
