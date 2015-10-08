class UserMailer < ApplicationMailer
	default from: 'no-reply@example.com'

	def welcome_email(user)
		@user = user
		@url = 'http://localhost:3000/'
		mail(to: @user.email, subject: 'Welcome to the Blog')
	end
end