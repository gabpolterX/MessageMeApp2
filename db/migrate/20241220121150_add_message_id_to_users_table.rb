class AddMessageIdToUsersTable < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :message_id, :integer
  end
end
