class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tours = Tour.order("created_at DESC")
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = current_user.tours.build
  end

  def create
    @tour = current_user.tours.build(tour_params)
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
    params.require(:tour).permit(:cover, :title, :description, :date, :price, :money, :place)
  end
end

