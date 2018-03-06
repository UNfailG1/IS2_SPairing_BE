class CreateThreadForums < ActiveRecord::Migration[5.1]
  def change
    create_table :thread_forums do |t|
      t.string :thr_name
      t.integer :thr_views
      t.integer :thr_number_comments
      t.references :SubForum, foreign_key: true
      t.references :Game, foreign_key: true

      t.timestamps
    end
  end
end
