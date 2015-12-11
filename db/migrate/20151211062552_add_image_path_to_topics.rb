class AddImagePathToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :image_path, :string
  end
end
