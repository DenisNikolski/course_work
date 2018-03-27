class PipesController < ApplicationController
  def new
    @pipe = Pipe.new
    @pipe_descr = Pipe_descr.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
  def pipe_params
    params.require(:pipe).permit(:title, :category_id, :img_src)
  end
end
