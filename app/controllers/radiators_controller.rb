class RadiatorsController < ApplicationController
  def new
    if admin_signed_in?
      @category_id = Category.find_by_name('Radiators').id
      @radiator = Radiator.new
      @radiator_descr = RadiatorDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @radiator = Radiator.new(radiator_params)
    @category_id = Category.find_by_name('Radiators').id
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

  def import_from_file
    if admin_signed_in?
      fields_to_insert = %w[title category_id img_src]
      file = params[:file]
      notice = 'Failed: no file or incorrect file (Radiators)!'
      unless file.nil?
        if file.path.include? '.csv'
          CSV.foreach(file.path, headers: true) do |row|
            row_to_insert = row.to_hash.select {|k, v| fields_to_insert.include?(k)}
            Radiator.create! row_to_insert
          end
          notice = 'Data (Radiators) imported from csv'
        elsif file.path.include? '.xml'
          Hash.from_xml(File.read(file.path)).values.first.values.first.each do |row|
            row_to_insert = row.select {|k, v| fields_to_insert.include?(k)}
            Radiator.create! row_to_insert
          end
          notice = 'Data (Radiators) imported from xml'
        end
      end
      redirect_to admin_path, notice: notice
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  private

  def radiator_params
    params.require(:radiator).permit(:title, :category_id, :img_src)
  end
end
