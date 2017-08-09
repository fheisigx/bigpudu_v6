class Admin::BaseController < ApplicationController

	before_action :require_admin

	#No estoy seguro de que sea lo mas correcto dejar esto acá,
	#ya que todos los controladores que heren de esto tendrán la funsión Dashboard
	def dashboard

	end

	def require_admin
		if logged_in?
			redirect_to root_path unless current_user.is_admin?
		else
			redirect_to root_path
		end
	end


end
