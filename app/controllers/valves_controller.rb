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

  def import_from_file
    if admin_signed_in?
      fields_to_insert = %w[title category_id img_src]
      file = params[:file]
      notice = 'Failed: no file or incorrect file!'
      unless file.nil?
        if file.path.include? '.csv'
          CSV.foreach(file.path, headers: true) do |row|
            row_to_insert = row.to_hash.select {|k, v| fields_to_insert.include?(k)}
            Valve.create! row_to_insert
          end
          notice = 'Data imported'
        elsif file.path.include? '.xml'
          Hash.from_xml(File.read(file.path)).values.first.values.first.each do |row|
            row_to_insert = row.select {|k, v| fields_to_insert.include?(k)}
            Valve.create! row_to_insert
          end
          notice = 'Data imported'
        end
      end
      redirect_to admin_path, notice: notice
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  private

  def valve_params
    params.require(:valve).permit(:title, :category_id, :img_src)
  end

end
