class CreateBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :boxes do |t|
      t.string :line
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :line4
      t.string :line5
      t.string :line6
      t.string :line7
      t.string :line8
      t.references :specification, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
