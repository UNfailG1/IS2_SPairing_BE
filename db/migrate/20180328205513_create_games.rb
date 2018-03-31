class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :gam_name
      t.text :gam_description
      t.string :gam_link
      t.references :pegi, foreign_key: true

      t.timestamps
    end
  end
end
