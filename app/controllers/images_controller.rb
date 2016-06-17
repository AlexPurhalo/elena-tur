class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :edit_permission, only: [:destroy, :create]
  def create
    @tour = Tour.find(params[:tour_id])
    @image = Image.create(image_params)
    @image.user_id = current_user.id
    @image.tour_id = @tour.id

    if @image.save
      redirect_to @tour
    else
      render 'new'
    end
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    @image = @tour.images.find(params[:id])
    @image.destroy
    redirect_to @tour

    unless @tour.user.admin?
      flash[:notice] = 'Only administration can delete images'
      redirect_to tour_path(@tour)
    end
  end

  private
  def image_params
    params.require(:image).permit(:content)
  end

  def edit_permission
    @tour = Tour.find(params[:tour_id])

    unless current_user.admin?
      flash[:notice] = 'Only administration can rule by posts'
      redirect_to @tour
    end
  end
end
