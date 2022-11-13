 class ArticlesController < ApplicationController

  def index
    @articles = Article.all.paginate(page: params[:page] || 1, per_page: 10)
    debugger
    respond_to do |format|
        format.html
    end
  end
  def new
    @article = Article.new
    respond_to do |format|
        format.html
    end
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article Saved Successfully.'
      redirect_to @article
      # redirect_to article_path(@article)
    else
      render :new
    end
  end
  def show
    @article = Article.find_by(id: params[:id])
    debugger
    respond_to do |format|
        format.html
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
 end