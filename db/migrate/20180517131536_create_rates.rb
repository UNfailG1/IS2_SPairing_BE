class CreateRates < ActiveRecord::Migration[5.1]
    create_table :rates do |t|
        t.float :rate_rate
        t.integer :player_game_profile_id
        t.integer :player_profile_id

        t.timestamps
    end
end
