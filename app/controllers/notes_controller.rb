class NotesController < ApplicationController

  before_action :authenticate_user!


  def new
    @trip = Trip.find(params[:trip_id])
    @note = Note.new
    @user = current_user
  end

  def create
    @note = Note.new(note_params)
    @trip = Trip.find(params[:trip_id])
    if @note.save
      @user = current_user
      redirect_to trip_path(@user, @trip)
    else
     render :new
    end
  end

  def update
  end

  def destroy
  end


private
  def note_params
    params.require(:note).permit(:author, :body, :trip_id, :user_id )
  end


end
