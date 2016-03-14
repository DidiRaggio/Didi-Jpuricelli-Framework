class Gallerytype < ActiveRecord::Base
	:name
	:title
	has_many :tags, :dependent => :destroy
	has_many :galleries, through: :tags
end
