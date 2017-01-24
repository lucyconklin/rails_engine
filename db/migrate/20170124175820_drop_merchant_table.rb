class DropMerchantTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :merchants, force: :cascade
  end
end
