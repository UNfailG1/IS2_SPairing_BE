class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.text :ad_description
      t.string :ad_link
      t.string :ad_image
      t.references :sponsor, foreign_key: true

      t.timestamps
    end
  end
end
