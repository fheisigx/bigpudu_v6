class Admin::InstitutionsController < Admin::BaseController
  
  before_action :set_institution, only: [:show, :edit, :update, :destroy]

  def index
  	@institutions = Institution.all.order_level_inst
  end

  def show

    #Cuando tengas las carreras, la idea es mostrar todos los ramos y carreras de cada institución
    #Con la posibilidad de ir a editar esa carrera y/o ramo

  end

  def new
  	@institution = Institution.new()
  end

  def create
  	@institution = Institution.new(institution_params)

    if @institution.save
      flash[:success] = "Institution created succesfully."
      redirect_to admin_institutions_path
    else 
      render('new')
    end

  end

  def edit
  end


  def update

    if @institution.update_attributes(institution_params)
      flash[:success] = "Institution updated succesfully."
      redirect_to admin_institutions_path
    else 
      render('edit')
    end
  end

  def destroy
    @institution.destroy
    flash[:success] = "Institution deleted"
    redirect_to admin_institutions_path
  end

  private
  def institution_params 
    params.require(:institution).permit(:name, :level)
  end

  def set_institution
    @institution = Institution.find(params[:id])
  end

end
