class Admin::CareersController < Admin::BaseController

  before_action :set_institution
  before_action :set_master_careers, only: [:new, :create, :edit, :update]
  before_action :set_career, only: [:show, :edit, :update, :destroy]

  def index
  	@careers = @institution.careers.order_mc_name
  end

  def show
    #Aún no estoy seguro de que mostrar
  end

  def new
  	@career = Career.new()
  end


  def create
  	@career = Career.new(career_params)

    if @career.save
      flash[:success] = "Carrera creada exitosamente."
      redirect_to admin_institution_careers_path(@institution)
    else
      render('new')
    end

  end

  def edit
  end

  def update
    
    if @career.update_attributes(career_params)
      flash[:success] = "Institution updated succesfully."
      redirect_to admin_institution_careers_path(@institution)
    else
      render('edit')
    end
  end

  def destroy
    @career.destroy
    flash[:success] = "Carrera eliminada"
    redirect_to admin_institution_careers_path(@institution)
  end


 private

  def set_institution 
    @institution = Institution.find(params[:institution_id])
  end

  def set_master_careers
    @master_careers = MasterCareer.all
  end

  def set_career
    @career = Career.find(params[:id])
  end

  def career_params 
    params.require(:career).permit(:institution_id, :master_career_id)
  end
end
