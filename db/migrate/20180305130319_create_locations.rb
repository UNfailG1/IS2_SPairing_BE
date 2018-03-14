class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.decimal :loc_lat
      t.decimal :loc_lon
      t.string :loc_name
      t.references :player_profile, foreign_key: true

      t.timestamps
    end
  end
end
