class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
    @gallery = Gallery.find(params[:id])
    respond_to format.js
  end

  def const
  	
  end

end
