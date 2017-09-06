# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  password_digest   :string
#  remember_digest   :string
#  name              :string
#  is_teacher        :boolean          default(FALSE)
#  is_admin          :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  activation_digest :string
#  activated         :boolean          default(FALSE)
#  reset_digest      :string
#  reset_sent_at     :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
