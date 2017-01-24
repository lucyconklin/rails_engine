class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.references :merchant, index: true, foreign_key: true
      t.citext :status

      t.timestamps precision: 0
    end
  end
end
