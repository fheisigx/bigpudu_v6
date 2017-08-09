class Admin::CareerCoursesController < Admin::BaseController
  before_action :set_career

  def index
  	@career_courses = @career.career_courses
  end

  def new
  	@courses = Course.institution(@career.institution_id)
  	@career_course = CareerCourse.new()
  end

  def create
  	@courses = Course.institution(@career.institution)
  	@career_course = CareerCourse.new(career_course_params)

    #Save de object
    if @career_course.save #If save succeeds, redirect to the index action
      flash[:success] = "Se ha agregado el ramo a la carrera."
      redirect_to admin_career_career_courses_path(@career)
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def edit
    @courses = Course.institution(@career.institution_id)
    @career_course = CareerCourse.find(params[:id]) 
  end

  def update
    @courses = Course.institution(@career.institution_id)
    @career_course = CareerCourse.find(params[:id])
    #Update de object
    if @career_course.update_attributes(career_course_params) #If update succeeds, redirect to the index action
      flash[:success] = "Ramo actualizado exitosamente."
      redirect_to admin_career_career_courses_path(@career)
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    CareerCourse.find(params[:id]).destroy
    flash[:success] = "Se ha eliminado el ramo de la carrera."
    redirect_to admin_career_career_courses_path(@career)
  end

 private
  def set_career 
    @career = Career.find(params[:career_id])
  end

  def career_course_params 
    params.require(:career_course).permit(:career_id, :course_id, :semester)
  end
end
