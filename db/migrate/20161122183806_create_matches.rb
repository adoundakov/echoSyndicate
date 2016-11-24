class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :first_article_id, null: false
      t.integer :second_article_id, null: false
      t.integer :score, null: false
      t.timestamps
    end

    add_index :matches, [:first_article_id, :second_article_id], unique: true
    add_index :matches, :second_article_id
  end
end
