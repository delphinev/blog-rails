class PagesController < ApplicationController
  def contact

  end

  def send_email
  	#contact = params[:email], params[:content]
  	ContactMailer.contact_email(contact_params).deliver_now
  	redirect_to "/contact"
  end

  private
  def contact_params
  	params.require(:contact).permit(:email, :content)
  end
end
