class RemovePublicFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :public, :boolean
  end
end
