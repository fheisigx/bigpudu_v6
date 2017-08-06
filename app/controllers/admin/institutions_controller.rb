class Admin::InstitutionsController < Admin::BaseController
  
  def index
  	@institutions = Institution.all
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

    #Save de object
    if @institution.save #If save succeeds, redirect to the index action
      flash[:success] = "Institution created succesfully."
      redirect_to admin_institutions_path
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def edit
    @institution = Institution.find(params[:id])   
  end


  def update
    #Find an existing object using form parameters
    @institution = Institution.find(params[:id])
    #Update de object
    if @institution.update_attributes(institution_params) #If update succeeds, redirect to the index action
      flash[:success] = "Institution updated succesfully."
      redirect_to admin_institutions_path
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    Institution.find(params[:id]).destroy
    flash[:success] = "Institution deleted"
    redirect_to admin_institutions_path
  end

  private
  def institution_params 
    params.require(:institution).permit(:name, :level)
  end

end
