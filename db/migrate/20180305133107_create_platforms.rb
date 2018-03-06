class CreatePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :platforms do |t|
      t.string :plat_name
      t.string :plat_link

      t.timestamps
    end
  end
end
