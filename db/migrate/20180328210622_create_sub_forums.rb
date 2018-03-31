class CreateSubForums < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_forums do |t|
      t.string :sf_name
      t.text :sf_description
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
