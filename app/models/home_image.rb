class HomeImage < ActiveRecord::Base
   scope :by_rank, -> {where(rank:true)}
  def self.to_rank
    order('rank asc')
  end

  has_attached_file :image, :styles => { :original => "1500x"},
  :hash_secret => "SOME_RANDOM_SECRET",
  :path => '/:class/:id/:style/:class:style:id.:extension'.gsub('/images')
  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	:image_file_name
	:image_content_type
	:image_file_size
	:image_updated_at
	:logoWhite
	:rank
end
