class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.integer :assettype_id
      t.integer :rank
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
