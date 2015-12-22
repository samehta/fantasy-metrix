class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully saved."
      redirect_to @article
    else
      flash[:error] = "There was an error saving the article. Please try again."
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
    else
      flash[:error] = "There was an error updating the article. Please try again."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "The article was successfully deleted."
      redirect_to articles_path
    else
      flash[:error] = "There was an error deleting the article. Please try again."
      render :show
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
