class RadiatorDescrsController < ApplicationController
  def new
    if admin_signed_in?
      @radiator_descr = RadiatorDescr.new
    else
      flash[:alert] = 'Access is denied'
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
      flash[:alert] = 'Access is denied'
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
      flash[:alert] = 'Access is denied'
      redirect_to root_path
    end
  end

  def index
  end

  def show
  end

  def import_from_file
    if admin_signed_in?
      fields_to_insert = %w[height length weight price radiator_id]
      file = params[:file]
      notice = 'Failed: no file or incorrect file (Radiator items)!'
      unless file.nil?
        if file.path.include? '.csv'
          CSV.foreach(file.path, headers: true) do |row|
            row_to_insert = row.to_hash.select {|k, v| fields_to_insert.include?(k)}
            RadiatorDescr.create! row_to_insert
          end
          notice = 'Data (Radiator items) imported from csv'
        elsif file.path.include? '.xml'
          Hash.from_xml(File.read(file.path)).values.first.values.first.each do |row|
            row_to_insert = row.select {|k, v| fields_to_insert.include?(k)}
            RadiatorDescr.create! row_to_insert
          end
          notice = 'Data (Radiator items) imported from xml'
        end
      end
      redirect_to admin_path, notice: notice
    else
      flash[:alert] = 'Access is denied'
      redirect_to root_path
    end
  end

  private

  def radiator_descrs_params
    params.require(:radiator_descr).permit(:height, :length, :weight, :price, :radiator_id)
  end

end
