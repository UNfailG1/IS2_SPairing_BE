class CreatePlayerBlackLists < ActiveRecord::Migration[5.1]
  def change
    create_table :player_black_lists do |t|
      t.references :pla_bla_list_p1, foreign_key: true
      t.references :pla_bla_list_p2, foreign_key: true

      t.timestamps
    end
  end
end
