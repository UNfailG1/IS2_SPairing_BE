class CreatePlayerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :player_profiles do |t|
      t.string :pp_username
      t.string :password_digest
      t.string :email
      t.float :pp_spairing_elo
      t.string :pp_googleId
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
