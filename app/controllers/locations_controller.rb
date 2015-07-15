class LocationsController < ApplicationController
	before_action :set_user_location, only: [:show, :edit, :update, :destroy]
	
	def index
    @user = current_user 
		@locations = Location.all
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
    @user = User.find(params[user_id])

	end

	def edit
	end

	def create
		@location = Location.new(location_params)
    
    # new_location = Location.create(

    #   :user_id => current_user.id)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
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

	# DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
   end
  end

  private
  
    def set_user_location
      @location = Location.find(params[:id])
    end

  
    def location_params
      params.require(:location).permit(:latitude, :longitude, :address, :description, :name, :user_id)
    end
end

