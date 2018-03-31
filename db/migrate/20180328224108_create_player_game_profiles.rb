class CreatePlayerGameProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :player_game_profiles do |t|
      t.float :pgp_reputation
      t.string :pgp_nickname
      t.float :pgp_rate
      t.references :game, foreign_key: true
      t.references :player_profile, foreign_key: true

      t.timestamps
    end
  end
end
