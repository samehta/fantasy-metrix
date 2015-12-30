class AddImagePathToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :image_path, :string
  end
end
