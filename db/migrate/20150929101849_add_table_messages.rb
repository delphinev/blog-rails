class AddTableMessages < ActiveRecord::Migration
  def change
    create_table :messages
    add_column :messages, :subject, :string
    add_column :messages, :content, :text
    add_column :messages, :from_id, :integer
    add_column :messages, :to_id, :integer

    add_index :messages, :from_id
    add_index :messages, :to_id
  end
end
