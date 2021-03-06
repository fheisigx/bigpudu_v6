# == Schema Information
#
# Table name: careers
#
#  id               :integer          not null, primary key
#  institution_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  master_career_id :integer
#

class Career < ApplicationRecord

	belongs_to :institution
	belongs_to :master_career

	has_many :career_courses, dependent: :destroy
	has_many :courses, :through => :career_courses

	validates :institution_id, presence: true, uniqueness: { scope: :master_career_id }
	validates :master_career_id, presence: true, uniqueness: { scope: :institution_id }

	def self.order_mc_name
    	includes(:master_career).order('master_careers.name ASC')
  	end
	
end
