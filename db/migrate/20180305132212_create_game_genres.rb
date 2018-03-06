class CreateGameGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :game_genres do |t|
      t.references :Game, foreign_key: true
      t.references :Genre, foreign_key: true

      t.timestamps
    end
  end
end
