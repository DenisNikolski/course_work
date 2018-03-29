class CategoriesController < ApplicationController
  def new
    @category = Category.new
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
    @categories = Category.all
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
