class Admin::AreasController < Admin::BaseController
  
  def index
  	@areas = Area.all 
  end

  def show
  	# Ver que agregar
  end

  def new
  	@area = Area.new() 	
  end

  def create
  	@area = Area.new(area_params)

    #Save de object
    if @area.save #If save succeeds, redirect to the index action
      flash[:success] = "Area creada exitosamente."
      redirect_to admin_areas_path
      #redirect_to(:action => 'index')
    else #If save fails, redisplay the form so user can fix problems
      render('new')
    end

  end

  def edit
    @area = Area.find(params[:id])   
  end

  def update
    #Find an existing object using form parameters
    @area = Area.find(params[:id])
    #Update de object
    if @area.update_attributes(area_params) #If update succeeds, redirect to the index action
      flash[:success] = "Area updated succesfully."
      redirect_to admin_areas_path
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end


 def destroy
    Area.find(params[:id]).destroy
    flash[:success] = "Area deleted"
    redirect_to admin_areas_path
  end


  private
  def area_params 
    params.require(:area).permit(:name)
  end
end
