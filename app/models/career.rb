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

class Career < ApplicationRecord

	belongs_to :institution

	validates :name, presence: true, uniqueness: { scope: :institution_id }
	validates :institution_id, presence: true
	
end
