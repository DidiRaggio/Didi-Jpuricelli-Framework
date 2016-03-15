class Gallery < ActiveRecord::Base
  scope :by_rank, -> {where(rank:true)}
  def self.to_rank
    order('rank asc')
  end

  def previous_gallery
      self.class.where(["rank < ?", rank]).first
  end

  def next_gallery
      self.class.where(["rank > ?", rank]).first
  end

  :name
  :sub
  :rank
  :description
  has_many :tags, :dependent => :destroy
  accepts_nested_attributes_for :tags, :allow_destroy =>  true
  has_many :gallerytypes, through: :tags
  has_many :assets, :dependent => :destroy

  has_attached_file :menuimage, :styles => { :original => "314x200" },
  :url => ':s3_alias_url',
  :s3_host_alias => 'static17.jpuricelli.com',
  :path => "files/uploads/menuimage/image/:class/:id.:style.:extension"
  validates_attachment :menuimage, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates :menuimage, presence: true

  accepts_nested_attributes_for :assets, :allow_destroy => true

# def self.tagged_with(name)
#   Gallerytype.find_by_name!(name).galleries
# end

# def self.tag_counts
#   Gallerytype.select("gallerytypes.*, count(tags.gallerytype_id) as count").
#     joins(:tags).group("tags.gallerytype_id")
# end

# def tag_list
#   gallerytypes.map(&:name).join(", ")
# end

# def tag_list=(names)
#   self.gallerytypes = names.split(",").map do |n|
#     Gallerytype.where(name: n.strip).first_or_create!
#   end
# end
end

