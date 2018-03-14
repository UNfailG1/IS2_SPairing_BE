class CreatePlayerBlackLists < ActiveRecord::Migration[5.1]
  def change
    create_table :player_black_lists do |t|
      t.references :blocker
      t.references :blocked

      t.timestamps
    end
  end
end
