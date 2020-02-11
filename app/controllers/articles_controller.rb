class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params_article)
    redirect_to root_path
  end

  def edit; end

  def update
    @article.update(params_article)
    redirect_to root_path
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
