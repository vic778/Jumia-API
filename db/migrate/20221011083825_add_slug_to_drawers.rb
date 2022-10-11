class AddSlugToDrawers < ActiveRecord::Migration[7.0]
  def change
    add_column :drawers, :slug, :string
    add_index :drawers, :slug, unique: true
  end
end
