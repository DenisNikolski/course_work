class RadiatorDescrsController < ApplicationController
  def new
    @radiator_descr = RadiatorDescr.new
  end

  def create
    @radiator_descr = RadiatorDescr.new(radiator_descrs_params)
    if @radiator_descr.save
      flash[:notice] = 'Radiator description is created'
      redirect_to radiator_descrs_path
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

  def radiator_descrs_params
    params.require(:radiator_descr).permit(:height, :length, :weight, :price, :radiator_id)
  end

end
