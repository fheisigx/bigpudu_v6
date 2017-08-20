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
	has_many :master_career_areas, dependent: :destroy
	has_many :courses

	has_many :master_careers, :through => :master_career_areas
	
	validates :name, presence: true, uniqueness: true

	def self.order_name
    	order(name: :asc)
  	end
end
