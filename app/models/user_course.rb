# == Schema Information
#
# Table name: user_courses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserCourse < ApplicationRecord

	belongs_to :user
	belongs_to :course

	validates :user_id, presence: true, uniqueness: { scope: :course_id }
	validates :course_id, presence: true, uniqueness: { scope: :user_id }

end
