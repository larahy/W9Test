class AddPriceToStories < ActiveRecord::Migration
  def change
    add_column :stories, :price, :integer
  end
end
