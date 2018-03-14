class CreatePlayerWhiteLists < ActiveRecord::Migration[5.1]
  def change
    create_table :player_white_lists do |t|
      t.references :player_friend_sender
      t.references :player_friend_recever

      t.timestamps
    end
  end
end
