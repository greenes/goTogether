class MembershipsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @memberships = Membership.where(:user_id => @user.id)
    @trips = Trip.where(:user_id => @user.id)
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
    # I don't think this line is doing what you think it is... a symbol
    # `:user_email` will _never_ equal nil, so this `if` statement always
    # enters the else case. Perhaps you meant params[:user_email]?
    if :user_email == nil
      render :new
    else
      if @membership.user_id == nil
        @membership.user = User.find_by(email: params[:user_email])
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
