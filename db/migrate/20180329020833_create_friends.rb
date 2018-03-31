class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends, id: false do |t|
      t.integer :player_profile_id
      t.integer :friend_player_profile_id
    end
  end
end
