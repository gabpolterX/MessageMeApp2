class AddMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :user_id
      t.timestamps
    end
  end
end
