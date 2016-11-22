class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :source_name, null: false
      t.date :date, null: false
      t.string :author, null: false
      t.string :image_url, null: false
      t.string :article_url, null: false
      t.text :description, null: false
      t.text :keywords, array: true, default: []
      t.timestamps
    end

    add_index :articles, :source_name
    add_index :articles, :date

  end
end
