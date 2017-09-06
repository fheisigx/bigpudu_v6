# == Schema Information
#
# Table name: master_career_areas
#
#  id               :integer          not null, primary key
#  master_career_id :integer
#  area_id          :integer
#  level            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class MasterCareerArea < ApplicationRecord

	belongs_to :master_career
	belongs_to :area

	validates :master_career_id, presence: true, uniqueness: { scope: :area_id }
	validates :area_id, presence: true, uniqueness: { scope: :master_career_id }
	validates :level, presence: true
	
end
