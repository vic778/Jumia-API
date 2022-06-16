class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :model
      t.float :price
      t.string :connexion
      t.string :cpu
      t.string :gpu
      t.string :system
      t.string :battery
      t.string :camera
      t.string :memory
      t.string :display
      t.string :card_sim
      t.string :image
      t.references :drawer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
