class Admin::MasterCareersController < Admin::BaseController

  before_action :set_master_career, only: [:edit, :update, :destroy]

  def index
  	@master_careers = MasterCareer.all.order_name
  end

  def show

    #Cuando tengas las carreras, la idea es mostrar todos los ramos y carreras de cada institución
    #Con la posibilidad de ir a editar esa carrera y/o ramo

  end

  def new
  	@master_career = MasterCareer.new()
  end

  def create
  	@master_career = MasterCareer.new(master_career_params)

    #Save de object
    if @master_career.save #If save succeeds, redirect to the index action
      flash[:success] = "Carrera Maestra creada con exito."
      redirect_to admin_master_careers_path
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def edit
  end


  def update


    if @master_career.update_attributes(master_career_params) #If update succeeds, redirect to the index action
      flash[:success] = "Carrera Maestra actualizada con exito."
      redirect_to admin_master_careers_path
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    @master_career.destroy
    flash[:success] = "Carrera Maestra eliminada."
    redirect_to admin_master_careers_path
  end

  private
  def master_career_params 
    params.require(:master_career).permit(:name)
  end

  def set_master_career
    @master_career = MasterCareer.find(params[:id])   
  end

end