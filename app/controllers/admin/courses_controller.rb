class Admin::CoursesController < Admin::BaseController
  before_action :set_institution
  before_action :set_areas, only: [:new, :create, :edit, :update]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
  	@courses = @institution.courses.order_name
  end

  def show
    #Aún no estoy seguro de que mostrar
  end

  def new
  	@course = Course.new()
  end


  def create
  	@course = Course.new(course_params)

    if @course.save
      flash[:success] = "Curso creado exitosamente."
      redirect_to admin_institution_courses_path(@institution)
    else
      render('new')
    end
  end


  def edit
  end

  def update

    if @course.update_attributes(course_params)
      flash[:success] = "Curso actualizado exitosamente."
      redirect_to admin_institution_courses_path(@institution)
    else
      render('edit')
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Curso eliminado"
    redirect_to admin_institution_courses_path(@institution)
  end


 private

  def set_institution 
    @institution = Institution.find(params[:institution_id])
  end

  def set_career
    @course = Course.find(params[:id])
  end

  def set_areas
    @areas = Area.all.order_name
  end

  def course_params 
    params.require(:course).permit(:code_name, :name, :area_id, :institution_id)
  end
end
