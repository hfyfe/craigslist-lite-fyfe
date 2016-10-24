module ApplicationHelper
  def errors_helper
    if @article.errors
      @article.errors
    end
  end

end
