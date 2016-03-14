class HomeImagesController < ApplicationController
  respond_to :html

  def sort
    HomeImages.rank_all(params[:homeImage_ids])
    head(:ok)
  end

	def index
		@homeImages = HomeImage.all
	end

	def new
		@homeImage = HomeImage.new
	end

	def create
		@homeImage = HomeImage.new(homeImage_params)
		if @homeImage.save
		redirect_to homeImages_path, :notice => 'Your homeImage has been created!'
		else
		render 'new'
		end
	end

	def edit
		@homeImage = HomeImage.find(params[:id])
	end

	def update
		@homeImage = HomeImage.find(params[:id])
		if @homeImage.update_attributes(homeImage_params)
			redirect_to homeImage_path, :notice => "Your homeImage has been updated!"
		else
			render "edit"
		end		
	end

	def show
		@homeImage = HomeImage.find(params[:id])
	end

	def destroy
		@homeImage = HomeImage.find(params[:id])
		@homeImage.destroy
		redirect_to homeImages_path, :notice => "Your homeImage has been deleted"
	end
	
	private
	def homeImage_params
      params.require(:homeImage).permit( :logoWhite, :rank, :image)
	end
end
