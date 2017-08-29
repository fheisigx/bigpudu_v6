# == Schema Information
#
# Table name: career_courses
#
#  id         :integer          not null, primary key
#  career_id  :integer
#  course_id  :integer
#  semester   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_career_courses_on_career_id  (career_id)
#  index_career_courses_on_course_id  (course_id)
#

class CareerCourse < ApplicationRecord

	belongs_to :career
	belongs_to :course

	validates :course_id, presence: true, uniqueness: { scope: :career_id }
	validates :career_id, presence: true, uniqueness: { scope: :course_id }
	validates :semester, presence: true
	
	def self.order_semester_c_name
		#Quizas hay forma de agrupar este orden por multiple criterio de tablas distintas
    	order('semester ASC').includes(:course).order('courses.name ASC' )
  	end

end
