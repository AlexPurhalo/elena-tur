class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :create_permission, only: [:new]
  before_action :edit_permission, only: [:edit, :update, :destroy]

  def index
    if params[:category].blank?
      @tours = Tour.order("created_at DESC").paginate(page: params[:page], per_page: 5).search(params[:search])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tours = Tour.where(category_id: @category_id).order("created_at DESC").paginate(page: params[:page], per_page: 7).where(["title LIKE ?", "%#{params[:search]}%"])
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = Comment.where(tour_id: @tour).paginate(page: params[:page], per_page: 10)
    @images = Image.where(tour_id: @tour).paginate(page: params[:page], per_page: 4)
  end

  def new
    @new_tour = current_user.tours.build
  end

  def create
    @tour = current_user.tours.build(tour_params)
    if @tour.save
      redirect_to @tour
    else
      render 'new'
    end

    unless current_user.admin?
      flash[:notice] = 'Only administration can add posts'
      redirect_to root_path
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

    unless current_user.admin?
      flash[:notice] = 'Only administration can add posts'
      redirect_to root_path
    end
  end

  def edit_permission
    @tour = Tour.find(params[:id])

    unless current_user.admin?
      flash[:notice] = 'Only administration can rule by posts'
      redirect_to @tour
    end
  end

  private
  def tour_params
    params.require(:tour).permit(:cover, :title, :description, :date, :price, :money, :place, :category_id)
  end
end
