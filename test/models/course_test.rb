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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
