class AddEmbededVideoToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :embeded_video, :string
  end
end
