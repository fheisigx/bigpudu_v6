class Admin::CareersController < Admin::BaseController

  before_action :set_institution

  def index
  	@careers = @institution.careers
  end

  def show
    #Aún no estoy seguro de que mostrar
  end

  def new
    @master_careers = MasterCareer.all
  	@career = Career.new()
  end


  def create
    @master_careers = MasterCareer.all
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
    @master_careers = MasterCareer.all
    @career = Career.find(params[:id]) 
  end

  def update
    @master_careers = MasterCareer.all
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
    params.require(:career).permit(:institution_id, :master_career_id)
  end
end
