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

require 'test_helper'

class MasterCareerAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
