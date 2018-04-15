class ValvesController < ApplicationController
  def new
    if admin_signed_in?
      @category_id = Category.find_by_name('Valves').id
      @valve = Valve.new
      @valve_descr = ValveDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @valve = Valve.new(valve_params)
    if @valve.save
      flash[:notice] = 'Valve is created'
      redirect_to '/valve_descrs/new'
    else
      render 'new'
    end
  end

  def update
    @valve = Valve.find(params[:id])
    @valve.update(valve_params)
    flash[:notice] = 'Valve is updated'
    redirect_to valf_path(@valve)

  end

  def edit
    if admin_signed_in?
      @valve = Valve.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @valve = Valve.find(params[:id])
      @valve.destroy
      flash[:notice] = 'Valve is removed'
      redirect_to categories_path
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def index
  end

  def show
    @valve = Valve.find(params[:id])
    @valve_descr = ValveDescr.find_by_valve_id(params[:id])
  end

  private

  def valve_params
    params.require(:valve).permit(:title, :category_id, :img_src)
  end
end
