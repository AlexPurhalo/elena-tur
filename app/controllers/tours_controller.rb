class ToursController < ApplicationController
  def index
    @tours = Tour.order("created_at DESC")
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

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update(tour_params)
    redirect_to @tour
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to root_path
  end

  private
  def tour_params
    params.require(:tour).permit(:cover, :title, :description, :date, :price, :place)
  end
end

