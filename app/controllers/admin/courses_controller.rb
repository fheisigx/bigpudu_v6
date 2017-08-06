class Admin::CoursesController < Admin::BaseController
  before_action :set_institution

  def index
  	@courses = @institution.courses
  end

  def show
    #Aún no estoy seguro de que mostrar
  end

  def new
  	@areas = Area.all
  	@course = Course.new()
  end


  def create
  	@areas = Area.all #Agregue esto aqquí para evitar el error de validación del area (avergigaur por que funciona)
  	@course = Course.new(course_params)

    #Save de object
    if @course.save #If save succeeds, redirect to the index action
      flash[:success] = "Curso creado exitosamente."
      redirect_to admin_institution_courses_path(@institution)
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end


  def edit
  	@areas = Area.all
    @course = Course.find(params[:id]) 
  end

  def update
  	@areas = Area.all
    #Find an existing object using form parameters
    @course = Course.find(params[:id])
    #Update de object
    if @course.update_attributes(course_params) #If update succeeds, redirect to the index action
      flash[:success] = "Curso actualizado exitosamente."
      redirect_to admin_institution_courses_path(@institution)
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Curso eliminado"
    redirect_to admin_institution_courses_path(@institution)
  end


 private

  def set_institution 
    @institution = Institution.find(params[:institution_id])
  end

  def course_params 
    params.require(:course).permit(:code_name, :name, :area_id, :institution_id)
  end
end
