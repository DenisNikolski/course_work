class PipesController < ApplicationController
  def new
    @pipe = Pipe.new
    @pipe_descr = PipeDescr.new
  end

  def create
    @pipe = Pipe.new(pipe_params)
    if @pipe.save
      flash[:notice] = 'Pipe is created'
      redirect_to '/pipe_descrs/new'
    else
      render 'new'
    end
  end

  def update
    @pipe = Pipe.find(params[:id])
    @pipe.update(pipe_params)
    flash[:notice] = 'Pipe is updated'
    redirect_to categories_path
  end

  def edit
    @pipe = Pipe.find(params[:id])
  end

  def destroy
    @pipe = Pipe.find(params[:id])
    @pipe.destroy
    flash[:notice] = 'Pipe is removed'
    redirect_to categories_path
  end

  def index
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
