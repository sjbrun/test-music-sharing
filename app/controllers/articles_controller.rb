class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new 
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render 'new'  ## render new article template in case of failure for another try
    end
  end

  def show
  end
  
  def destroy
  end

  private
    def set_article  ## create private method to reuse
      @article = Article.find(params[:id])
    end
    def article_params  # whitelist method
      params.require(:article).permit(:title, :key, :instrument, :description)
    end

end

