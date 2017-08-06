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

class Course < ApplicationRecord

	belongs_to :institution
	belongs_to :area

	validates :code_name, presence: true, uniqueness: { scope: :institution_id }
	validates :name, presence: true
	validates :institution_id, presence: true
	validates :area_id, presence: true

end
