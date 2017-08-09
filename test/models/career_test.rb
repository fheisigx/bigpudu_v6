# == Schema Information
#
# Table name: careers
#
#  id               :integer          not null, primary key
#  name             :string
#  institution_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  master_career_id :integer
#
# Indexes
#
#  index_careers_on_institution_id    (institution_id)
#  index_careers_on_master_career_id  (master_career_id)
#

require 'test_helper'

class CareerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
