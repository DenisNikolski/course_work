class RadiatorsController < ApplicationController
  def new
    if admin_signed_in?
      @radiator = Radiator.new
      @radiator_descr = RadiatorDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
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
    redirect_to radiator_path(@radiator)
  end

  def edit
    if admin_signed_in?
      @radiator = Radiator.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @radiator = Radiator.find(params[:id])
      @radiator.destroy
      flash[:notice] = 'Radiator is removed'
      redirect_to categories_path
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
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
