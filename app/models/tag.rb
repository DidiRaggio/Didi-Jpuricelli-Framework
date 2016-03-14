class Tag < ActiveRecord::Base
  belongs_to :gallerytype
  belongs_to :gallery
  :gallery_id
  :gallerytype_id
end
