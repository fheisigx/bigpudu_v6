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

require 'test_helper'

class CareerCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
