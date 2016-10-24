class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    p @article
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      @errors = @category.errors
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  private

  def category_params
      params.require(:category).permit(:name, :description)
  end

end