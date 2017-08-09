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
# Indexes
#
#  index_master_career_areas_on_area_id           (area_id)
#  index_master_career_areas_on_master_career_id  (master_career_id)
#

require 'test_helper'

class MasterCareerAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
