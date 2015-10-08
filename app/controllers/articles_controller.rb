class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(5)
    @users = User.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    #Article.create title: params[:title], content: params[:content], date: DateTime.now(), user_id: current_user.id
    @article = Article.new article_params
    @article.date= DateTime.now()
    @article.user_id= current_user.id
    authorize @article
    @article.save
    redirect_to '/'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    @article.update article_params
    @article.date= DateTime.now()
    @article.save
    #@article.update title: params[:title], content: params[:content], date: DateTime.now(), user_id: current_user.id
    redirect_to @article  #"/articles/#{params[:id]}"
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to '/'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :picture)
  end
end
