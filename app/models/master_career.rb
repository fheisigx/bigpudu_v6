# == Schema Information
#
# Table name: master_careers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MasterCareer < ApplicationRecord
	has_many :careers, dependent: :destroy
	has_many :master_career_areas
	has_many :areas, :through => :master_career_areas

	validates :name, presence: true, uniqueness: true
	
end
