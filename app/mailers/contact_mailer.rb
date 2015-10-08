class ContactMailer < ApplicationMailer

	def contact_email(contact)
		@contact = contact
		mail(to: "delphine.vilaysack@gmail.com", subject: "Mandrill test")
	end
end
