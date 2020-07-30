class AddColumnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :play_people, :integer
    add_column :games, :play_time, :integer
  end
end
