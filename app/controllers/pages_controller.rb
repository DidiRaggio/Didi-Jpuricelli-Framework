class PagesController < ApplicationController
  def home
  	@homeImages = HomeImage.all.to_rank
    @galleries = Gallery.all.to_rank
  	@assets = Asset.all.to_rank
    @gallerytypes = Gallerytype.all 
    @tags = Tag.all
    @abouts = About.all
  end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @assets = Asset.all.to_rank
      @galleries = Gallery.all.to_rank
        @rankarray = @galleries.map(&:rank)
      @rankarraylength = @rankarray.size

        respond_to do |format|
    format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
    format.js
  end
 
  end

  def const
  	
  end

end
