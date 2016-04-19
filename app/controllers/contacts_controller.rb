class ContactsController < ApplicationController
	respond_to :html
	def new
    @contact = Contact.new
    end
    def create
    @contact = Contact.new(contact_params)


    if @contact.valid?
      ContactMailer.contact_created(@contact).deliver
      ResponseMailer.response_created(@contact).deliver_now
      flash[:notice] = "Gracias por contactarse!"
      # redirect_to :back, :notice => "Gracias por contactarse!"
    else
      # redirect_to :back
      flash[:notice] = "No se pudo contactar :("
    end

  end
	# def destroy
	# 	@contact = Contact.find(params[:id])
	# 	@contact.destroy
	# 	redirect_to contacts_path, :notice => "Su contact ha sido borrado"
	# end
	private
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
