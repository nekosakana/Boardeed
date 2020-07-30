class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
