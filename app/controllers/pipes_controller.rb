class PipesController < ApplicationController
  def new
    if admin_signed_in?
      @category_id = Category.find_by_name('Pipes').id
      @pipe = Pipe.new
      @pipe_descr = PipeDescr.new
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def create
    @pipe = Pipe.new(pipe_params)
    @category_id = Category.find_by_name('Pipes').id
    if @pipe.save
      flash[:notice] = 'Pipe is created'
      redirect_to '/pipe_descrs/new'
    else
      render 'new'
    end
  end

  def update
    @pipe = Pipe.find(params[:id])
    @pipe.update(pipe_params)
    flash[:notice] = 'Pipe is updated'
    redirect_to pipe_path(@pipe)
  end

  def edit
    if admin_signed_in?
      @pipe = Pipe.find(params[:id])
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      @pipe = Pipe.find(params[:id])
      @pipe.destroy
      flash[:notice] = 'Pipe is removed'
      redirect_to categories_path
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  def index
  end

  def show
    @pipe = Pipe.find(params[:id])
    @pipe_descr = PipeDescr.find_by_pipe_id(params[:id])
  end

  def import_from_file
    if admin_signed_in?
      fields_to_insert = %w[title category_id img_src]
      file = params[:file]
      notice = 'Failed: no file or incorrect file (Pipes)!'
      unless file.nil?
        if file.path.include? '.csv'
          CSV.foreach(file.path, headers: true) do |row|
            row_to_insert = row.to_hash.select {|k, v| fields_to_insert.include?(k)}
            Pipe.create! row_to_insert
          end
          notice = 'Data (Pipes) imported from csv'
        elsif file.path.include? '.xml'
          Hash.from_xml(File.read(file.path)).values.first.values.first.each do |row|
            row_to_insert = row.select {|k, v| fields_to_insert.include?(k)}
            Pipe.create! row_to_insert
          end
          notice = 'Data (Pipes) imported from xml'
        end
      end
      redirect_to admin_path, notice: notice
    else
      flash[:alert] = 'You need to authorise'
      redirect_to root_path
    end
  end

  private

  def pipe_params
    params.require(:pipe).permit(:title, :category_id, :img_src)
  end
end
