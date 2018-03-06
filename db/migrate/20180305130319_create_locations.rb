class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.decimal :loc_lat
      t.decimal :loc_lon
      t.string :loc_name

      t.timestamps
    end
  end
end
