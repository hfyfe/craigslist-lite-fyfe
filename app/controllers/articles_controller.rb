class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @category = Category.find(params[:category_id])
    @article.category = @category
    if @article.save
      @key = @article.key
      render "show"
    else
      @errors = @article.errors
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    if @article.key != params[:key]
      redirect_to category_article_path(@article.category,@article)
    end
  end

  def update
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
    @article.update_attributes(article_params)
    if @article.save
      redirect_to category_article_path(@article.category,@article)
    else
      @category = @article.category
      @errors = @article.errors
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
    @article.delete
    redirect_to @category
  end


  private

  def article_params
      params.require(:article).permit(:title, :description, :contact_email, :author)
  end
end