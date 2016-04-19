class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
    # @gallery = Gallery.find(params[:id])


    flash[:notice] = "THis isn't working!"
    @contact = Contact.new
    
    puts params
    puts @contact.as_json.to_s
    if @contact.post?

    puts params
    puts @contact.as_json.to_s

      # ContactMailer.contact_created(@contact).deliver
      # ResponseMailer.response_created(@contact).deliver_now
      flash[:notice] = "Gracias por contactarse!"
      # redirect_to :back, :notice => "Gracias por contactarse!"
    else
      # redirect_to :back
      flash[:notice] = "No se pudo contactar :("
    end



  end



  def const
  	
  end

#   def render_partial
#   respond_to do |format|               
#     format.js
#   end        
# end 

  private
  def gallery_params
      params.require(:gallery).permit( :id, :name, :sub, :assets , :tags, :rank, :menuimage, :description , assets_attributes: [:image, :description, :title, :embeded_video, :assettype_id, :gallery_id], tags_attributes: [:id, :gallery_id, :gallerytype_id])
  end

  def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
