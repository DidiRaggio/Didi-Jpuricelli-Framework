class RemoveTitleFromAssets < ActiveRecord::Migration
  def change
    remove_column :assets, :title, :string
  end
end
