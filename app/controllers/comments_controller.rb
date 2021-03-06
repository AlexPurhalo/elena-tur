class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :edit_permission, only: [:destroy]
  def create
    @tour = Tour.find(params[:tour_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.tour_id = @tour.id

    if @comment.save
      redirect_to tour_path(@tour)
    else
      render 'new'
    end
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.find(params[:id])
    @comment.destroy
    redirect_to @tour
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  def edit_permission
    @tour = Tour.find(params[:tour_id])

    unless current_user.admin?
      flash[:notice] = 'Only administration can rule by posts'
      redirect_to @tour
    end
  end
end
