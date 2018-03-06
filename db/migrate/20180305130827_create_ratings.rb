class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :rat_rater, foreign_key: true
      t.references :rat_recever, foreign_key: true
      t.float :rat_rate

      t.timestamps
    end
  end
end
