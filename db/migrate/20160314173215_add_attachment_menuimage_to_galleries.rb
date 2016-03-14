class AddAttachmentMenuimageToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :menuimage
    end
  end

  def self.down
    remove_attachment :galleries, :menuimage
  end
end
