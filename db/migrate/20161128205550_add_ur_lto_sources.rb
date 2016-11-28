class AddUrLtoSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :logo_url, :string, null: false
  end
end
