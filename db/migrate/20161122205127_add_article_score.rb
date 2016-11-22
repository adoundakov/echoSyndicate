class AddArticleScore < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :score, :float, null: false
  end
end
