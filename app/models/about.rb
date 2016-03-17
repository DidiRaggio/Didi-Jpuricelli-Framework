class About < ActiveRecord::Base

  has_attached_file :image, :styles => { :original => "2000x" }, :default_url => "/images/:style/missing.png"
  # :url => ':s3_alias_url',
  # :s3_host_alias => 'static20.jpuricelli.com',
  # :path => "files/uploads/about/image/:class/:id.:style.:extension"
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	:image_file_name
	:image_content_type
	:image_file_size
	:image_updated_at
	:title
	:description
	

end
