# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  code_name      :string
#  name           :string
#  institution_id :integer
#  area_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_courses_on_area_id         (area_id)
#  index_courses_on_institution_id  (institution_id)
#

class Course < ApplicationRecord

	belongs_to :institution
	belongs_to :area

	has_many :career_courses, dependent: :destroy
	has_many :careers, :through => :career_courses

	validates :code_name, presence: true, uniqueness: { scope: :institution_id }
	validates :name, presence: true
	validates :institution_id, presence: true
	validates :area_id, presence: true

	scope :institution, -> (institution_id) {where institution_id: institution_id} 

	def self.order_name
    	order(name: :asc)
  	end

end
