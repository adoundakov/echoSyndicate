class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :private_name, null: false
      t.string :public_name, null: false
      t.integer :score, null: false
      t.timestamps
    end

    add_index :sources, :private_name, unique: true
    add_index :sources, :public_name, unique: true
  end
end
