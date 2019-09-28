class PartsController < ApplicationController
    http_basic_authenticate_with name: "dhh",
      password: "secret", only: :destroy
    def create
        @bike = Bike.find(params[:bike_id])
        @parts = @bike.parts.create(part_params)
        redirect_to bike_path(@bike)
    end

    def destroy
        @bike = Bike.find(params[:bike_id])
        @part = @bike.parts.find(params[:id])
        @part.destroy
        redirect_to bike_path(@bike)
    end

    private
      def part_params
        params.require(:part).permit(:parts_name)
      end
end
