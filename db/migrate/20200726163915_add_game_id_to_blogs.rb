class AddGameIdToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :game_id, :integer
  end
end
