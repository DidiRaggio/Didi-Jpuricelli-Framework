class About < ActiveRecord::Base

  has_attached_file :image, :styles => { :original => "2000x" }, :default_url => "/images/:style/missing.png"
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	:image_file_name
	:image_content_type
	:image_file_size
	:image_updated_at
	:title
	:description
	

end