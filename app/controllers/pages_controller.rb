class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
    # @gallery = Gallery.find(params[:id])
    @contact = Contact.new(params[:id])

    if @contact.save



      ContactMailer.contact_created(@contact).deliver
      ResponseMailer.response_created(@contact).deliver_now
      # flash[:notice] = "Comment was successfully created."
      redirect_to :back, :notice => "Gracias por contactarse!"
    else
      # flash[:notice] = "Error creating post_comment: #(@post_comment.errors)"
      # redirect_to :back, :notice => "Error creating contact: #(@contact.errors)"
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
