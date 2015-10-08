class AddPictureToArticles < ActiveRecord::Migration
  def change
    add_attachment :articles, :picture
  end
end
