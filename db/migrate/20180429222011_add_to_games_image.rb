class AddToGamesImage < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gam_image, :string
  end
end
