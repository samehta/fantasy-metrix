class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :college
      t.float :draft

      t.timestamps null: false
    end
  end
end
