class SessionsController < ApplicationController

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

	#Cambiar mis ramos
	def mis_ramos

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
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
		  if user.activated?
		    log_in user
		    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
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
