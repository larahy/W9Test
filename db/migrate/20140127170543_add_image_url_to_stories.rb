class AddImageUrlToStories < ActiveRecord::Migration
  def change
    add_column :stories, :image_url, :text
  end
end
