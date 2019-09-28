class BikesController < ApplicationController
    http_basic_authenticate_with name: "dhh",
      password: "secret", except: [:index, :show]
    def index
        @bike = Bike.all
    end

    def edit
        @bike = Bike.find(params[:id])
    end

    def show
        @bike = Bike.find(params[:id])
    end

    def new
        @bike = Bike.new
    end

    def create
      @bike = Bike.new(bike_params)

      if @bike.save
        redirect_to @bike
      else
        render 'new'
      end
    end

    def update
      @bike = Bike.find(params[:id])

      if @bike.update(bike_params)
        redirect_to @bike
      else
        render 'edit'
      end
    end

    def destroy
        @bike = Bike.find(params[:id])
        @bike.destroy

        redirect_to bikes_path
    end

    private
      def bike_params
        params.require(:bike).permit(:maker,:machine_name)
      end
end
