class AddCategoryIdToDrawers < ActiveRecord::Migration[7.0]
  def change
    add_column :drawers, :category_id, :integer, foreign_key: true
  end
end
