class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment= Comment.new
  end

  def create
    #constantize permet de transformer string en classe
    commentable_class = params[:model_name].constantize
    commentable_fk = params[:model_name].foreign_key
    @commentable = commentable_class.find(params[commentable_fk])
    @comment= Comment.new
      @comment.content = params[:content]
      @comment.user_id = current_user.id
      #@comment.commentable_type = "User"
      #@comment.commentable_id = @user.id
      @comment.commentable = @commentable
    @comment.save
    redirect_to @commentable
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to @comment.commentable
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  #   #Comment.find(params[:id]).update content: params[:content]
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.update content: params[:content]
    redirect_to @comment.commentable
  #  redirect_to article_path(@comment.article_id)
  end
end
