class PipeDescrsController < ApplicationController
  def new
    @pipe_descr = PipeDescr.new
  end

  def create
    @pipe_descr = PipeDescr.new(pipe_descrs_params)
    if @pipe_descr.save
      flash[:notice] = 'Pipe description is created'
      redirect_to pipe_descrs_path
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
  end

  def show
  end

  private

  def pipe_descrs_params
    params.require(:pipe_descr).permit(:diameter, :wall_thickness, :price, :pipe_id)
  end

end
