class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def create_comment
    @user = User.find(params[:id])
    @comment= Comment.new
      @comment.content = params[:content]
      @comment.user_id = current_user.id
      #@comment.commentable_type = "User"
      #@comment.commentable_id = @user.id
      @comment.commentable = @user
    @comment.save
    redirect_to "/users/#{params[:id]}"
  end

  def destroy_comment
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to @comment.commentable
  end
end
