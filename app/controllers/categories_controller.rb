class CategoriesController < ApplicationController
  def new
    if admin_signed_in?
      @category = Category.new
    else
      flash[:alert] = 'You need to authorise'
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

  private

  def category_params
    params.require(:category_id).permit(:name)
  end
end
