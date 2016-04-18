class ResponseMailer < ApplicationMailer
	def response_created(contact)
		@contact = contact
		mail(to: contact.email,
			from: "didiraggio@gmail.com",
			subject: "Thank you for contacting me",
			

			)

	end
end
