class PipeDescrsController < ApplicationController
  def new
    if admin_signed_in?
      @pipe_descr = PipeDescr.new
    else
      flash[:alert] = 'Access is denied'
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
      flash[:alert] = 'Access is denied'
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
      fields_to_insert = %w[diameter wall_thickness weight price pipe_id]
      file = params[:file]
      notice = 'Failed: no file or incorrect file (Pipe items)!'
      unless file.nil?
        if file.path.include? '.csv'
          CSV.foreach(file.path, headers: true) do |row|
            row_to_insert = row.to_hash.select {|k, v| fields_to_insert.include?(k)}
            PipeDescr.create! row_to_insert
          end
          notice = 'Data (Pipe items) imported from csv'
        elsif file.path.include? '.xml'
          Hash.from_xml(File.read(file.path)).values.first.values.first.each do |row|
            row_to_insert = row.select {|k, v| fields_to_insert.include?(k)}
            PipeDescr.create! row_to_insert
          end
          notice = 'Data (Pipe items) imported from xml'
        end
      end
      redirect_to admin_path, notice: notice
    else
      flash[:alert] = 'Access is denied'
      redirect_to root_path
    end
  end

  private

  def pipe_descrs_params
    params.require(:pipe_descr).permit(:diameter, :wall_thickness, :price, :pipe_id)
  end

end
