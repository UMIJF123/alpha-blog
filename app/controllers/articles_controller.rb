 class ArticlesController < ApplicationController
  before_action :load_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all.paginate(page: params[:page] || 1, per_page: 10)
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
      #render 'new'
    end
  end
  def show
    respond_to do |format|
        format.html
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article Updated Successfully.'
      redirect_to @article
    else
      render :edit
      #render 'edit'
    end
  end

  def destroy
    flash[:notice] = @article.destroy ? 'Article Deleted Successfully.' : 'Article Not Deleted Successfully.'
    redirect_to articles_path
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def load_article
    @article = Article.find_by(id: params[:id])
  end
  
 end