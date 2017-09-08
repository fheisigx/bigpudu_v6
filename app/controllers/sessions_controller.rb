class SessionsController < ApplicationController
	protect_from_forgery except: :busqueda_catedras

	# Página Principal
	def welcome

	end

	# Cambiar de carrera (Gorila)
	def mi_carrera

	end		

	# Cambiar mis ramos (Gorila)
	def mis_ramos

	end

	# mi_horario (Gorila) [Podriamos reemplazar esto por una lista]
	def mi_horario

	end

	def mis_ramos
		@institutions = Institution.all
		@user_courses = UserCourse.where(active: true, user_id: current_user.id).includes(:course => :institution).order('institutions.name','courses.name')
	end

	def agregar_ramos
		@user = current_user
		active_courses = current_user.courses.joins(:user_courses).where(:user_courses =>{:active => true})

		@institution = Institution.find(params[:institution_id])
		@courses = @institution.courses.joins(:area).order('areas.name', 'courses.name').where.not(:courses =>{id: active_courses},:areas =>{name: ['Random']}) 
		#byebug	
	end



	#Cambiar mis horarios
	def mi_horario

	end	

	def mis_solicitudes
		
	end

	def ensenar
		
	end

	def busqueda_catedras

	end

	def oauth_connect
		
	end

	def facebook_login
		
	end	

	# Login - Ok
	def new
		@user = User.new
	end

	#OK
	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
		  if user.activated?
		    log_in user
		    params[:remember_me] == '1' ? remember(user) : forget(user)
		    redirect_back_or user
		  else
		    message  = "Account not activated. "
		    message += "Check your email for the activation link."
		    flash[:warning] = message
		    redirect_to root_url
		  end
		else
		  flash.now[:danger] = 'Invalid email/password combination'
		  render 'new'
		end
	end

	def destroy
    	log_out if logged_in?
	    redirect_to root_url
	end

	def counter
		
	end

	def about_us
		
	end
		

end
