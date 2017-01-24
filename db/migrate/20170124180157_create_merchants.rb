class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.text :name

      t.timestamps precision: 0
    end
  end
end
