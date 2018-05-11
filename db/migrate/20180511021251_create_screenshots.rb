class CreateScreenshots < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots do |t|
      t.string :scr_url
      t.integer :scr_height
      t.integer :scr_width
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
