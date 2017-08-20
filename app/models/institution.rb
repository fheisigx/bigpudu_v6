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

	INST_TYPE =[
		["U. Tradicional", 5],
		["U. Privada", 4],
		["I. Profesional", 3],
		["CFT",2],
		["Colegio",1]
	]

	has_many :careers, dependent: :destroy
	has_many :courses, dependent: :destroy

	has_many :master_careers, :through => :careers #probando para importar desde excel

	validates :name, presence: true, uniqueness: true
	validates :level, presence: true

	def self.order_level_inst
		order(level: :desc, name: :asc)
	end


end
