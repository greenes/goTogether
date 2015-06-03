class AccommodationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    if params[:query]
      @results = Accommodation.search(params[:query])
    else
      @results = Accommodation.search(@trip.trip_location)
    end

    respond_to do |format|
        format.html { render :index }
        format.json { render json: @results }
      end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @results = session[:results][params[:index].to_i]
    @accommodation = Accommodation.new
    @user = current_user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new(accommodation_params)
    if @accommodation.save
      session[:results] = {}
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
