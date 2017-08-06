# == Schema Information
#
# Table name: careers
#
#  id             :integer          not null, primary key
#  name           :string
#  institution_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CareerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
