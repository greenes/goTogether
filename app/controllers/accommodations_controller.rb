class AccommodationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @results = Accommodation.search(params[:query])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new(acc_name: @type , acc_location: @location, acc_cost: @pernight, acc_link: @link, trip_id: @trip.id )
    @user = current_user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new(acc_name: @type , acc_location: @location, acc_cost: @pernight, acc_link: @link, trip_id: @trip.id )
    if @accommodation.save
      @user = current_user
      redirect_to trip_path(@trip)
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
