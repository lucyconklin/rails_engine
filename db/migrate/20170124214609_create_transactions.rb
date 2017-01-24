class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice_id, foreign_key: true
      t.integer :credit_card_number
      t.string :credit_card_expiration_date
      t.citext :status, index: :true

      t.timestamps, precision: 0
    end
  end
end
