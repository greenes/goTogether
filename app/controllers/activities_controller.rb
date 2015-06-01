class ActivitiesController < ApplicationController

  before_action :authenticate_user!


  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new
    @user = current_user
  end

  def create
    @activity = Activity.new(activity_params)
    @trip = Trip.find(params[:trip_id])
    if @activity.save
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
  def activity_params
    params.require(:activity).permit(:act_name, :act_location, :act_cost, :link, :trip_id )
  end


end
