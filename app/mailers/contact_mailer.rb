class ContactMailer < ApplicationMailer

	def contact_created(contact)
		@contact = contact

		mail(to: "didiraggio@gmail.com",
			from: contact.email,
			subject: contact.subject,
			

			)
	end
end
