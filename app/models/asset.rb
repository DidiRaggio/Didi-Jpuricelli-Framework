class Asset < ActiveRecord::Base
   scope :by_rank, -> {where(rank:true)}
  def self.to_rank
    order('rank asc')
  end
belongs_to :gallery
belongs_to :assettype
  has_attached_file :image, :styles => { :original => "2000x", :medium => "740x470", :thumb => "120x80" }, :default_url => "/images/:style/missing.png"
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	:image_file_name
	:image_content_type
	:image_file_size
	:image_updated_at
	:title
	:description
	:embeded_video
	:assettype_id
	:gallery_id
	:rank
	

end
