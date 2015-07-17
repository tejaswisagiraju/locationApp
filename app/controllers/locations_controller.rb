class LocationsController < ApplicationController
	before_action :set_user_location, only: [:show, :edit, :update, :destroy]
	
	def index

    if current_user
      @user = current_user
		  @locations = @user.locations.all
    else
       @locations = Location.all
    end

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
			marker.lat location.latitude
		  marker.lng location.longitude
			marker.infowindow location.description
    end
      
  end

	def show
	end

	def new
		@location = Location.new
    @user = current_user 

	end

	def edit
	end

	def create
		@location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to user_location_path, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end 
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Lser was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    # @location = current_user.locations.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
   end
  end

  private
  
    def set_user_location
       # @location = current_user.locations.find(params[:id])
      @location = Location.find(params[:id])
    end

  
    def location_params
      params.require(:location).permit(:latitude, :longitude, :address, :description, :name, :user_id)
    end
end

