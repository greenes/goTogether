class MembershipsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @memberships = Membership.where(:user_id => @user.id)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @notes = @trip.notes.all
    @accommodations = @trip.accommodations.all
    @activities = @trip.activities.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @user = current_user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    if @member.save
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
  def member_params
    params.require(:member).permit(:member_name, :member_email, :trip_id )
  end


end
