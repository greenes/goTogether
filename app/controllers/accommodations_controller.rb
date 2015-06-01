class AccommodationsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new
    @user = current_user
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @trip = Trip.find(params[:trip_id])
    if @accommodation.save
      @user = current_user
      redirect_to user_trip_path(@user, @trip)
    else
     render :new
    end
  end

  def update
  end

  def destroy
  end


private
  def accommodation_params
    params.require(:accommodation).permit(:acc_name, :acc_location, :acc_cost, :acc_link, :trip_id )
  end


end
