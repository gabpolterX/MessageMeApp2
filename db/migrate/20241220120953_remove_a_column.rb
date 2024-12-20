class RemoveAColumn < ActiveRecord::Migration[7.2]
  def change
    remove_column :messages, :message_id
  end
end
