class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :thread_forum, foreign_key: true
      t.references :player_profile, foreign_key: true
      t.string :com_comment

      t.timestamps
    end
  end
end
