class PipesController < ApplicationController
  def new
    @pipe = Pipe.new
    @pipe_descr = PipeDescr.new
  end

  def create
    @pipe = Pipe.new(pipe_params)
    if @pipe.save
      flash[:notice] = 'Pipe created'
      redirect_to pipes_path
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @pipes = Pipe.all
    @categories = Category.all
  end

  def show
    @pipe = Pipe.find(params[:id])
    @pipe_descr = PipeDescr.find_by_pipe_id(params[:id])
  end

  private

  def pipe_params
    params.require(:pipe).permit(:title, :category_id, :img_src)
  end
end
