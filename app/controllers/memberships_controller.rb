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
    @membership = Membership.new
    @user = current_user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @membership = Membership.new(membership_params)
    if :user_email != nil
      if @membership.user_id == nil
      @membership.user_id = User.find_by(email: params[:user_email]).id
      end
    end

    if @membership.save
      @user = current_user
      redirect_to trip_path(@trip)
    else
     render :new
    end
  end

  def destroy
    @member = Membership.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @member.delete
    redirect_to trip_path(@trip)

  end


private
  def membership_params
    params.require(:membership).permit(:user_id, :trip_id)
  end


end
