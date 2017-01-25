class ChangeColumnInTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :status, :result
  end
end
