class CreateAssettypes < ActiveRecord::Migration
  def change
    create_table :assettypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
