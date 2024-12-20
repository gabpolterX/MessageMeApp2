class DeleteMessageIdColumn < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :message_id
  end
end
