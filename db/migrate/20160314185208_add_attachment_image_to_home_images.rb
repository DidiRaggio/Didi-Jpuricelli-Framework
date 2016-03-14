class AddAttachmentImageToHomeImages < ActiveRecord::Migration
  def self.up
    change_table :home_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :home_images, :image
  end
end
