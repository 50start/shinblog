class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
    
  end

  def edit
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
     if @article.save
      redirect_to root_path(@article), notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
     end
  end
  
  def update
  if @article.update(article_params)
    redirect_to root_path(@article), notice: '更新できました'
  else
    render :edit,　alert: '更新できませんでした'
  end
  end
  
  def destroy
    if @article.destory
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end
  
  private
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
     params.require(:article).permit(:title, :body, :image)
  end  

  def update_params
     params.require(:article).permit(:title, :body, :image)
  end

end
