class AddKeyToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :key, :string
  end
end
