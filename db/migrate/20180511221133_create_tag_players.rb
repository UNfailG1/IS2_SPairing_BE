class CreateTagPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_players,  id: false do |t|
      t.integer :player_game_profile_id
      t.integer :tag_id
    end
  end
end
