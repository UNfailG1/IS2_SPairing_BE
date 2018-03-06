class CreatePegis < ActiveRecord::Migration[5.1]
  def change
    create_table :pegis do |t|
      t.string :peg_name
      t.integer :peg_age
      t.string :peg_image

      t.timestamps
    end
  end
end
