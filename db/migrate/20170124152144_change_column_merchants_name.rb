class ChangeColumnMerchantsName < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
    change_column :merchants, :name, :citext
    add_index :merchants, :name, unique: true
  end
end
