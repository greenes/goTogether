class MembersController < ApplicationController

  before_action :authenticate_user!

  def show
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @members = @trip.members.all
    @notes = @trip.notes.all
    @accommodations = @trip.accommodations.all
    @activities = @trip.activities.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @member = Member.new
    @user = current_user
  end

  def create
    @member = Member.new(member_params)
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
