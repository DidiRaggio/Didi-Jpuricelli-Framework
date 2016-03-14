class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :rank
      t.string :name
      t.string :sub
      t.text :description

      t.timestamps null: false
    end
  end
end
