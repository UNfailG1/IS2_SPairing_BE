class CreateMailboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mailboxes do |t|
      t.references :mail_sender, foreign_key: true
      t.references :mail_recever, foreign_key: true
      t.string :mail_message

      t.timestamps
    end
  end
end
