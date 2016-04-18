class Contact
  include ActiveModel::Model
	attr_accessor :name, :email, :subject, :message
	validates :name, :email, :subject, :message, presence: true
  # validates_presence_of :name, presence: true,      :validate => true
  # validates_length_of :name, :within => 2..20
  # validates_presence_of :email, presence: true,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  # validates_presence_of :subject, presence: true
  # validates_presence_of :message, presence: true

  def persisted?
    self.id == 1
  end
end
