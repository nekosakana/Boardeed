class AddRateToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :rate, :float
  end
end
