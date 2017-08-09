class CareerCourse < ApplicationRecord

	belongs_to :career
	belongs_to :course

	validates :course_id, presence: true, uniqueness: { scope: :career_id }
	validates :career_id, presence: true, uniqueness: { scope: :course_id }
	validates :semester, presence: true
	
end
