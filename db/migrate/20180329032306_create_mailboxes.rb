class CreateMailboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mailboxes do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :mail_message

      t.timestamps
    end
  end
end
