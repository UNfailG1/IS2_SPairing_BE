class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :rat_rater
      t.references :rat_recever
      t.float :rat_rate

      t.timestamps
    end
  end
end
