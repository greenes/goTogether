class AccommodationsController < ApplicationController

      before_action :authenticate_user!

      def index
        @user = current_user
        @trip = Trip.find(params[:trip_id])
        @accommodation = Accommodation.new
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

      def edit
        @accommodation = Accommodation.find(params[:id])
        @trip = Trip.find(params[:trip_id])
      end

      def update
        @accommodation = Accommodation.find(params[:id])
        @trip = Trip.find(params[:trip_id])
        if @accommodation.update( accommodation_params )
          redirect_to @trip
        else
          render :edit
        end
      end

      def destroy
        @accommodation = Accommodation.find(params[:id])
        @trip = Trip.find(params[:trip_id])
        @accommodation.delete
        redirect_to trip_path(@trip)
      end


    private
      def accommodation_params
        params.require(:accommodation).permit(:acc_name, :acc_location, :acc_cost, :acc_link, :trip_id )
      end


end
