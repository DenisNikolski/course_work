class RadiatorsController < ApplicationController
  def new
    @radiator = Radiator.new
    @radiator_descr = RadiatorDescr.new
  end

  def create
    @radiator = Radiator.new(radiator_params)
    if @radiator.save
      flash[:notice] = 'Radiator is created'
      redirect_to '/radiator_descrs/new'
    else
      render 'new'
    end
  end

  def update
    @radiator = Radiator.find(params[:id])
    @radiator.update(radiator_params)
    flash[:notice] = 'Radiator is updated'
    redirect_to categories_path
  end

  def edit
    @radiator = Radiator.find(params[:id])
  end

  def destroy
    @radiator = Radiator.find(params[:id])
    @radiator.destroy
    flash[:notice] = 'Radiator is removed'
    redirect_to categories_path
  end

  def index
  end

  def show
    @radiator = Radiator.find(params[:id])
    @radiator_descr = RadiatorDescr.find_by_radiator_id(params[:id])
  end

  private

  def radiator_params
    params.require(:radiator).permit(:title, :category_id, :img_src)
  end
end
