class TripsController < ApplicationController

  before_action :authenticate_user!

  def index
    @trips = Trip.all
    @user = current_user
  end

  def show
    @trip = Trip.find(params[:id])
    @user = current_user
    @memberships = Membership.where(:trip_id => @trip.id)
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
      @membership = Membership.create(trip_id: @trip.id, user_id: @user.id, pending: false)
      redirect_to user_memberships_path(@user)
    else
     render :new
    end
  end

  # def join
  #   @trip = Trip.find(params[:id])
  #   @trip.users << current_user
  #   @trip.save
  #
  # end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update( trip_params )
      redirect_to @trip
    else
      render :edit
    end
  end

  def destroy
  end


private
  def trip_params
    params.require(:trip).permit(:trip_name, :trip_dates, :trip_location, :user_id)
  end

  def membership_params
    params.require(:membership).permit(:trip_id, :user_id, :pending )
  end


end
