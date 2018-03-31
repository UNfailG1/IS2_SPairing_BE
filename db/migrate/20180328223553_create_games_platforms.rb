class CreateGamesPlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :games_platforms, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :platform, index: true
    end
  end
end
