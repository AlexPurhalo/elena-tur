class ToursController < ApplicationController
  def index

  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to @tour
    else
      render 'new'
    end
  end

  private
  def tour_params
    params.require(:tour).permit(:cover, :title, :description, :date, :price, :place)

  end
end

