class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :create_permission, only: [:new, :create]
  before_action :edit_permission, only: [:edit, :update, :destroy]

  def index
    @tours = Tour.order("created_at DESC")
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = Comment.where(tour_id: @tour)
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

  def create_permission
    @tour = current_user.tours.build

    unless @tour.user.admin?
      flash[:notice] = 'Only administration can add posts'
      redirect_to root_path
    end
  end

  def edit_permission
    @tour = Tour.find(params[:id])

    unless @tour.user == current_user
      flash[:notice] = 'Only administration can rule by posts'
      redirect_to @tour
    end
  end

  private
  def tour_params
    params.require(:tour).permit(:cover, :title, :description, :date, :price, :money, :place)
  end
end
