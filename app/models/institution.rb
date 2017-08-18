# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Institution < ApplicationRecord

	has_many :careers, dependent: :destroy
	has_many :courses, dependent: :destroy

	has_many :master_careers, :through => :careers #probando para importar desde excel

	validates :name, presence: true, uniqueness: true
	validates :level, presence: true
end
