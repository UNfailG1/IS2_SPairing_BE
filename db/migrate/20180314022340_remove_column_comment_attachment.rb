class RemoveColumnCommentAttachment < ActiveRecord::Migration[5.1]
  def change
    remove_column :attachments, :Comment_id
  end
end
