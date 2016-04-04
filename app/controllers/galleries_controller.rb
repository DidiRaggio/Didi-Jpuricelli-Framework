class GalleriesController < ApplicationController
  respond_to :html

  def sort
    Galleries.rank_all(params[:gallery_ids])
    head(:ok)
  end

	def index
		@gallerys = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.new(gallery_params)
		if @gallery.save
		redirect_to galleries_path, :notice => 'Your gallery has been created!'
		else
		render 'new'
		end
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update_attributes(gallery_params)
			redirect_to gallery_path, :notice => "Your gallery has been updated!"
		else
			render "edit"
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

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		redirect_to galleries_path, :notice => "Your gallery has been deleted"
	end

	private
	def gallery_params
      params.require(:gallery).permit( :id, :name, :sub, :assets , :tags, :rank, :menuimage, :description , assets_attributes: [:image, :description, :title, :embeded_video, :assettype_id, :gallery_id], tags_attributes: [:id, :gallery_id, :gallerytype_id])
  	end

end


