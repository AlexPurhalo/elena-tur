class ToursController < ApplicationController
  def index

  end
  def show
    @tour = Tour.find(params[:id])
  end
end
