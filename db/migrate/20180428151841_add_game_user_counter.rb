class AddGameUserCounter < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :gam_user_counter, :integer
  end
end
