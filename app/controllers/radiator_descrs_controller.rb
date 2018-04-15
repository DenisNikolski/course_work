class RadiatorDescrsController < ApplicationController
  def new
    if admin_signed_in?
      @radiator_descr = RadiatorDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @radiator_descr = RadiatorDescr.new(radiator_descrs_params)
    if @radiator_descr.save
      flash[:notice] = 'Radiator item is created'
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @radiator_descr = RadiatorDescr.find(params[:id])
    @radiator_descr.update(radiator_descrs_params)
    flash[:notice] = 'Radiator item is updated'
    redirect_to radiator_path(@radiator_descr.radiator_id)
  end

  def edit
    if admin_signed_in?
      @radiator_descr = RadiatorDescr.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @radiator_descr = RadiatorDescr.find(params[:id])
      @radiator_descr.destroy
      flash[:notice] = 'Radiator item is removed'
      redirect_to radiator_path(@radiator_descr.radiator_id)
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

  def radiator_descrs_params
    params.require(:radiator_descr).permit(:height, :length, :weight, :price, :radiator_id)
  end

end
