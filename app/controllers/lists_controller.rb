class ListsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def eat_params
    params.require(:eat).permit(:title, :body, :image)
  end 
end
