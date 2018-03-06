class CreateGamePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :game_platforms do |t|
      t.references :Platform, foreign_key: true
      t.references :Game, foreign_key: true

      t.timestamps
    end
  end
end
