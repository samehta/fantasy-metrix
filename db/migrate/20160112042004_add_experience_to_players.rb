class AddExperienceToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :experience, :string
  end
end
