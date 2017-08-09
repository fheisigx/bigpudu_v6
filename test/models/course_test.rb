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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
