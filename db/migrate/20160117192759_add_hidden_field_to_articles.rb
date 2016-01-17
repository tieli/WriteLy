class AddHiddenFieldToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :hidden, :boolean
  end
end
