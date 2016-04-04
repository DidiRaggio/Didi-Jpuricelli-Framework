class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @assets = Asset.all.to_rank
      @galleries = Gallery.all.to_rank
        @rankarray = @galleries.map(&:rank)
      @rankarraylength = @rankarray.size
 
  end
  
  def const
  	
  end

end
