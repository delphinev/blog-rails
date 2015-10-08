class MessagesController < ApplicationController
  def index
  	@user = current_user
  	@messages = Message.all
  end

  def new
    @user = User.find(params[:id])
  end

  def create
  	@user = User.find(params[:id])
  	@message= Message.new message_params
  	@message.from_id = current_user.id
  	@message.to_id = @user.id
  	@message.save
  	redirect_to "/"
  end

  private
  def message_params
    params.require(:message).permit(:subject, :content)
  end
end
