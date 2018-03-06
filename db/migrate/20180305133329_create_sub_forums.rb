class CreateSubForums < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_forums do |t|
      t.string :sub_for_name
      t.string :sub_for_description
      t.references :Game, foreign_key: true

      t.timestamps
    end
  end
end
