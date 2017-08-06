class Admin::BaseController < ApplicationController

	before_action :require_admin

	def require_admin
		if logged_in?
			redirect_to root_path unless current_user.is_admin?
		else
			redirect_to root_path
		end
	end


end
