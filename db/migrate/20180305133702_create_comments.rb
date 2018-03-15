class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :com_com
      t.references :thread, foreign_key: true
      t.references :player_profile

      t.timestamps
    end
  end
end
