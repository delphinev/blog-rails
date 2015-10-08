class TableComments < ActiveRecord::Migration
  def change
    create_table :comments
    add_column :comments, :content, :text
    add_column :comments, :created_at, :datetime
    add_column :comments, :updated_at, :datetime
    add_column :comments, :user_id, :integer
    add_column :comments, :article_id, :integer

    add_index :comments, :user_id
    add_index :comments, :article_id
  end
end
