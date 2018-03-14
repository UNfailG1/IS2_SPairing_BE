class CreateGamesAndGamesGenresAndGamesPlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :gam_name
      t.string :gam_description
      t.string :gam_link
      t.references :pegi, foreign_key: true

      t.timestamps
    end

    create_table :games_genres, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :game, index: true
    end

    create_table :games_platforms do |t|
      t.belongs_to :platform, index: true
      t.belongs_to :game, index: true
    end
  end
end
