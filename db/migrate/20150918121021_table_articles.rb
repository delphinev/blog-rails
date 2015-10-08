class TableArticles < ActiveRecord::Migration
  def change
    create_table :articles
    add_column :articles, :title, :string
    add_column :articles, :content, :string
    add_column :articles, :date, :datetime
  end
end
