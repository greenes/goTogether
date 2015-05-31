class TripsController < ApplicationController

  before_action :authenticate_user!

  def index
    @trips = Trip.all
    @user = current_user
  end

  def show
    @trip = Trip.find(params[:id])
    @user = current_user
    @members = @trip.members.all
    @notes = @trip.notes.all
    @accommodations = @trip.accommodations.all
    @activities = @trip.activities.all
  end

  def new
    @trip = Trip.new
    @user = current_user
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
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
  def trip_params
    params.require(:trip).permit(:trip_name, :trip_dates )
  end

  def usertrip_params
    params.require(:usertrip).permit(:trip_id, :user_id )
  end


end
