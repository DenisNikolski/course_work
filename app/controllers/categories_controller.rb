class CategoriesController < ApplicationController
  def new
    if admin_signed_in?
      @category = Category.new
    else
      flash[:alert] = 'Access is denied'
      redirect_to root_path
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category is created'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @pipe = Pipe.find(params[:id])
    @pipe.destroy
    flash[:notice] = 'Pipe is removed'
    redirect_to categories_path
  end

  def index
    @pipes = Pipe.all
    @radiators = Radiator.all
    @valves = Valve.all
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = case @category.name
                when 'Pipes'
                  Pipe.all
                when 'Radiators'
                  Radiator.all
                when 'Valves'
                  Valve.all
                else
                  '#'
                end
  end

  def search
    search = params[:search]
    @pipes = Pipe.where('title like ?', "%#{search}%")
    @valves = Valve.where('title like ?', "%#{search}%")
    @radiators = Radiator.where('title like ?', "%#{search}%")
  end

  private

  def category_params
    params.require(:category_id).permit(:name)
  end
end
