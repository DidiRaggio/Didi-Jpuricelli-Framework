class CreateHomeImages < ActiveRecord::Migration
  def change
    create_table :home_images do |t|
      t.boolean :logoWhite
      t.integer :rank

      t.timestamps null: false
    end
  end
end
