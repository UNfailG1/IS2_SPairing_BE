class CreatePlayerGameProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :player_game_profiles do |t|
      t.decimal :player_reputation
      t.string :player_nickname
      t.decimal :player_game_rate
      t.references :player_profile, foreign_key: true
      t.references :dame, foreign_key: true

      t.timestamps
    end
  end
end
