class CreatePlayerBlackLists < ActiveRecord::Migration[5.1]
  def change
    create_table :player_black_lists do |t|
      t.references :blocker, foreign_key: true
      t.references :blocked, foreign_key: true

      t.timestamps
    end
  end
end
