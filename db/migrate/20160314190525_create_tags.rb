class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :gallerytype_id
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
