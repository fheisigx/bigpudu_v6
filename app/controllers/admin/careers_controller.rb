class Admin::CareersController < Admin::BaseController

  before_action :set_institution

  def index
  	@careers = @institution.careers
  end

  def show
    #Aún no estoy seguro de que mostrar
  end

  def new
  	@career = Career.new()
  end


  def create
  	@career = Career.new(career_params)

    #Save de object
    if @career.save #If save succeeds, redirect to the index action
      flash[:success] = "Carrera creada exitosamente."
      redirect_to admin_institution_careers_path(@institution)
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end


  def edit
    @career = Career.find(params[:id]) 
  end

  def update
    #Find an existing object using form parameters
    @career = Career.find(params[:id])
    #Update de object
    if @career.update_attributes(career_params) #If update succeeds, redirect to the index action
      flash[:success] = "Institution updated succesfully."
      redirect_to admin_institution_careers_path(@institution)
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    Career.find(params[:id]).destroy
    flash[:success] = "Carrera eliminada"
    redirect_to admin_institution_careers_path(@institution)
  end


 private

  def set_institution 
    @institution = Institution.find(params[:institution_id])
  end

  def career_params 
    params.require(:career).permit(:name, :institution_id)
  end
end
