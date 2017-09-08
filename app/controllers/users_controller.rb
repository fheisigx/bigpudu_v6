class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def show
 	  @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url

  end

  #NESTED Models (GOrila)

  def inscribir_ramos
    #@user = current_user
    #@user.attributes = {'course_ids' => []}.merge(user_course_params || {})
    #@user.user_courses(user_course_params)

    #@user.user_courses.where(course_id: user_course_params['course_ids']).update_all(:active => true)
    if params['course_ids'].nil?
      flash[:warning] = "No seleccionaste ningún ramo"
    else
      params['course_ids'].each do |course|
        user_course = UserCourse.find_or_initialize_by(user_id: current_user.id, course_id: course)
        user_course.active = true
        user_course.save
      end
      flash[:success] = "Ramos inscritos exitosamente"
    end
    redirect_to mis_ramos_path
  end


  def desinscribir_ramo

    user_course = UserCourse.find(params[:id])
    user_course.update_attributes(active: false)
      flash[:success] = "Ramo desinscrito exitosamente"
      redirect_to mis_ramos_path

  end






  private
	def user_params	
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.is_admin?
  end
end
