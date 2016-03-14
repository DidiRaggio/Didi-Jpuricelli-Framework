class CreateGallerytypes < ActiveRecord::Migration
  def change
    create_table :gallerytypes do |t|
      t.string :name
      t.string :title

      t.timestamps null: false
    end
  end
end
