class CreateGamesGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :games_genres, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :genre, index: true
    end
  end
end
