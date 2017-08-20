class Admin::MasterCareerAreasController < Admin::BaseController

  before_action :set_areas, only: [:new, :create, :edit, :update]
  before_action :set_master_careers, only: [:new, :create, :edit, :update]
  before_action :set_master_career_area, only: [:edit, :update, :destroy]
  
  def index
  	@master_career_areas = MasterCareerArea.all
  end

  def show

    #Cuando tengas las carreras, la idea es mostrar todos los ramos y carreras de cada institución
    #Con la posibilidad de ir a editar esa carrera y/o ramo

  end

  def new
  	@master_career_area = MasterCareerArea.new()
  end

  def create
  	@master_career_area = MasterCareerArea.new(master_career_area_params)

    if @master_career_area.save
      flash[:success] = "Relación Carrera Maestra con Area creada con exito."
      redirect_to admin_master_career_areas_path
    else
      render('new')
    end

  end

  def edit 
  end


  def update

    if @master_career_area.update_attributes(master_career_area_params)
      flash[:success] = "Relación Carrera Maestra y Area actualizada con exito."
      redirect_to admin_master_career_areas_path
    else
      render('edit')
    end
  end

  def destroy
    @master_career_area.destroy
    flash[:success] = "Relación Carrera Maestra y Area eliminada."
    redirect_to admin_master_career_areas_path
  end



  private
  def master_career_area_params 
    params.require(:master_career_area).permit(:master_career_id, :area_id, :level)
  end

  def set_areas
    @areas = Area.all.order_name
  end

  def set_master_careers
    @master_careers = MasterCareer.all.order_name
  end

  def set_master_career_area
    @master_career_area = MasterCareerArea.find(params[:id])   
  end


end
