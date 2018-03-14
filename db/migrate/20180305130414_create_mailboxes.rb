class CreateMailboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mailboxes do |t|
      t.references :mail_sender
      t.references :mail_recever
      t.string :mail_message

      t.timestamps
    end
  end
end
