class CreateItemsWithCi < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.citext :name, index: true
      t.citext :description
      t.integer :unit_price
      t.references :merchant, index: true, foreign_key: true

      t.timestamps precision: 0
    end
  end
end
