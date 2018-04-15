class PipeDescrsController < ApplicationController
  def new
    if admin_signed_in?
      @pipe_descr = PipeDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @pipe_descr = PipeDescr.new(pipe_descrs_params)
    if @pipe_descr.save
      flash[:notice] = 'Pipe item is created'
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @pipe_descr = PipeDescr.find(params[:id])
    @pipe_descr.update(pipe_descrs_params)
    flash[:notice] = 'Pipe item is updated'
    redirect_to pipe_path(@pipe_descr.pipe_id)
  end

  def edit
    if admin_signed_in?
      @pipe_descr = PipeDescr.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @pipe_descr = PipeDescr.find(params[:id])
      @pipe_descr.destroy
      flash[:notice] = 'Pipe item is removed'
      redirect_to pipe_path(@pipe_descr.pipe_id)
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
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
