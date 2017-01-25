class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.citext :first_name, index: true
      t.citext :last_name, index: true

      t.timestamps precision: 0
    end
  end
end
