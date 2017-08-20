class Admin::AreasController < Admin::BaseController
  
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
  	@areas = Area.all.order_name
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
  end

  def update
    #Update de object
    if @area.update_attributes(area_params) #If update succeeds, redirect to the index action
      flash[:success] = "Area updated succesfully."
      redirect_to admin_areas_path
    else #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end


 def destroy
    @area.destroy
    flash[:success] = "Area deleted"
    redirect_to admin_areas_path
  end


  private

  def set_area
    @area = Area.find(params[:id])  
  end

  def area_params 
    params.require(:area).permit(:name)
  end
end
