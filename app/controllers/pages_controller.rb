class PagesController < ApplicationController
  def home
    @galleries = Gallery.all.to_rank
 	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
  end
end
