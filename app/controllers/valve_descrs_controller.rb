class ValveDescrsController < ApplicationController
  def new
    if admin_signed_in?
      @valve_descr = ValveDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @valve_descr = ValveDescr.new(valve_descrs_params)
    if @valve_descr.save
      flash[:notice] = 'Valve item is created'
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @valve_descr = ValveDescr.find(params[:id])
    @valve_descr.update(valve_descrs_params)
    flash[:notice] = 'Valve item is updated'
    redirect_to valf_path(@valve_descr.valve_id)
  end

  def edit
    if admin_signed_in?
      @valve_descr = ValveDescr.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @valve_descr = ValveDescr.find(params[:id])
      @valve_descr.destroy
      flash[:notice] = 'Valve item is removed'
      redirect_to valve_path(@valve_descr.valve_id)
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

  def valve_descrs_params
    params.require(:valve_descr).permit(:radius, :pressure, :max_temperature, :price, :valve_id)
  end
end
