class CreateBlockedPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :blocked_players, id: false do |t|
      t.integer :player_profile_id
      t.integer :blocked_player_profile_id
    end
  end
end
