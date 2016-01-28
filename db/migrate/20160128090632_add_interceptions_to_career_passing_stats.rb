class AddInterceptionsToCareerPassingStats < ActiveRecord::Migration
  def change
    add_column :career_passing_stats, :interceptions, :integer
  end
end
