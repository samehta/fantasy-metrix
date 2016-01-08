class AddDateOfBirthToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :date_of_birth, :date
  end
end
