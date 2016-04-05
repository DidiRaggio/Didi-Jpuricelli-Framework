class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
    # @gallery = Gallery.find(params[:id])
    # respond_to format.js
  end

  def const
  	
  end

  def render_partial
  respond_to do |format|               
    format.js
    format.json
  end        
end 

  private
  def gallery_params
      params.require(:gallery).permit( :id, :name, :sub, :assets , :tags, :rank, :menuimage, :description , assets_attributes: [:image, :description, :title, :embeded_video, :assettype_id, :gallery_id], tags_attributes: [:id, :gallery_id, :gallerytype_id])
  end


end
