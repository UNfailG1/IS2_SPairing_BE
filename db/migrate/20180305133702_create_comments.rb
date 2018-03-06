class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :com_com
      t.references :Thread, foreign_key: true
      t.references :SubForum, foreign_key: true
      t.references :Game, foreign_key: true
      t.references :PlayerProfile

      t.timestamps
    end
  end
end
