class Admin::MasterCareerAreasController < Admin::BaseController

  def index
  	@master_career_areas = MasterCareerArea.all
  end

  def show

    #Cuando tengas las carreras, la idea es mostrar todos los ramos y carreras de cada institución
    #Con la posibilidad de ir a editar esa carrera y/o ramo

  end

  def new
  	@areas = Area.all
  	@master_careers = MasterCareer.all
  	@master_career_area = MasterCareerArea.new()
  end

  def create
   	@areas = Area.all
  	@master_careers = MasterCareer.all
  	@master_career_area = MasterCareerArea.new(master_career_area_params)

    #Save de object
    if @master_career_area.save #If save succeeds, redirect to the index action
      flash[:success] = "Relación Carrera Maestra con Area creada con exito."
      redirect_to admin_master_career_areas_path
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def edit
  	@areas = Area.all
  	@master_careers = MasterCareer.all
    @master_career_area = MasterCareerArea.find(params[:id])   
  end


  def update
    #Find an existing object using form parameters
    @master_career_area = MasterCareerArea.find(params[:id])
    #Update de object
    if @master_career_area.update_attributes(master_career_area_params) #If update succeeds, redirect to the index action
      flash[:success] = "Relación Carrera Maestra y Area actualizada con exito."
      redirect_to admin_master_career_areas_path
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    MasterCareerArea.find(params[:id]).destroy
    flash[:success] = "Relación Carrera Maestra y Area eliminada."
    redirect_to admin_master_career_areas_path
  end



  private
  def master_career_area_params 
    params.require(:master_career_area).permit(:master_career_id, :area_id, :level)
  end


end
