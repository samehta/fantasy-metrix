class AddImagePathToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :image_path, :string
  end
end
