class PropertyrecordsController < ApplicationController
  def index
    @propertyrecords = Propertyrecord.all
  end

  def show
    @propertyrecord = Propertyrecord.find(params[:id])
  end

  def new
    @propertyrecord = Propertyrecord.new
  end

  def create
    puts property_params
    @propertyrecord = Propertyrecord.new(property_params)
    puts "Data Enter Ok!"

    if @propertyrecord.save
      puts "successfully"
      @propertyrecord.update(status: 'active')
      redirect_to @propertyrecord, notice: "Propertyrecord was successfully created."
    else
      puts "no save"
      @propertyrecords = Propertyrecord.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @propertyrecord = Propertyrecord.find(params[:id])
  end

  def update
    @propertyrecord = Propertyrecord.find(params[:id])

    if @propertyrecord.update(property_params)
      @propertyrecord.update(status: 'active')
      redirect_to @propertyrecord
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def archived
    @archived_propertyrecords = Propertyrecord.where(status: 'archived')
  end

 def soft_delete
  @propertyrecord = Propertyrecord.find(params[:id])
  @propertyrecord.update(status: 'archived')
  redirect_to :propertyrecords, notice: 'Successfully Archived'
 end

 def restore
  @propertyrecord = Propertyrecord.find(params[:id])
  @propertyrecord.update(status: 'active')
  redirect_to root_path, notice: 'Successfully restored'
end

  def destroy
    soft_delete
  end

  def destroy_permanent
    @propertyrecord = Propertyrecord.find(params[:id])
    @propertyrecord.destroy
    redirect_to archived_path, status: :see_other
  end
  
  private
    def property_params
      params.require(:propertyrecord).permit(:name, :description, :notes, :status)
    end

end
