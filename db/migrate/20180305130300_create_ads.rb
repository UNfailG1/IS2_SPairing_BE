class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :ad_description
      t.string :ad_link
      t.string :ad_image_path
      t.references :Sponsor, foreign_key: true

      t.timestamps
    end
  end
end
