require 'smarter_csv'

namespace :import do

  desc "Import customers from csv"
  task customers: :environment do
    counter = 0
    CSV.foreach("db/csv/customers.csv", headers: true) do |row|
      customer = Customer.create(id: row["id"],
                                first_name: row["first_name"],
                                last_name:  row["last_name"],
                                created_at: row["created_at"],
                                updated_at: row["updated_at"])
      puts "#{first_name} #{last_name}- #{customer.errors.full_messages.join(", ")}" if customer.errors.any?
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"

  end
  desc "Import merchants from csv"
  task merchants: :environment do
    counter = 0
    CSV.foreach("db/csv/merchants.csv", headers: true) do |row|
      merchant = Merchant.create(id:         row["id"],
                                 name:       row["name"],
                                 created_at: row["created_at"],
                                 updated_at: row["updated_at"] )
      puts "#{name}- #{merchant.errors.full_messages.join(", ")}" if merchant.errors.any?
      counter += 1 if merchant.persisted?
    end

    puts "Imported #{counter} merchants"
  end

  desc "Import items from csv"
    task items: :environment do
      counter = 0
      CSV.foreach("db/csv/items.csv", headers: true) do |row|
        item = Item.create(id:          row["id"],
                          name:         row["name"],
                          description:  row["description"],
                          unit_price:   row["unit_price"],
                          merchant_id:  row["merchant_id"],
                          created_at:   row["created_at"],
                          updated_at:   row["updated_at"])
      puts "#{name}- #{item.errors.full_messages.join(", ")}" if item.errors.any?
      counter += 1 if item.persisted?
    end

    puts "Imported #{counter} items"
  end

<<<<<<< HEAD
  desc "Import invoices from csv"
    task invoices: :environment do
      counter = 0
      CSV.foreach("db/csv/invoices.csv", headers: true) do |row|
        invoice = Invoice.create(id:         row["id"],
                          customer_id: row["customer_id"],
                          merchant_id: row["merchant_id"],
                          status:      row["status"],
                          created_at:  row["created_at"],
                          updated_at:  row["updated_at"])
      puts "#{id}- #{invoice.errors.full_messages.join(", ")}" if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end

    puts "Imported #{counter} invoices"
  end

  desc "Import invoice_items from csv"
    task invoice_items: :environment do
      counter = 0
      CSV.foreach("db/csv/invoice_items.csv", headers: true) do |row|
        invoice_item = InvoiceItem.create(id:         row["id"],
                                          item_id:    row["item_id"],
                                          invoice_id: row["invoice_id"],
                                          quantity:   row["quantity"],
                                          unit_price: row["unit_price"],
                                          created_at: row["created_at"],
                                          updated_at: row["updated_at"])
      puts "#{id}- #{invoice_item.errors.full_messages.join(", ")}" if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
    end

    puts "Imported #{counter} invoice_items"
  end

  desc "Import transactions from csv"
    task transactions: :environment do
      counter = 0
      CSV.foreach("db/csv/transactions.csv", headers: true) do |row|
        transaction = Transaction.create(id:                          row["id"],
                                         invoice_id:                  row["invoice_id"],
                                         credit_card_number:          row["credit_card_number"],
                                         credit_card_expiration_date: row["credit_card_expiration_date"],
                                         result:                      row["result"],
                                         created_at:                  row["created_at"],
                                         updated_at:                  row["updated_at"])
      puts "#{id}- #{transaction.errors.full_messages.join(", ")}" if transaction.errors.any?
      counter += 1 if transaction.persisted?
    end

    puts "Imported #{counter} transactions"
  end
=======
  desc "Import invoice items from csv"
    task invoice_items: :environment do
      counter = 0
      CSV.foreach("db/csv/invoice_items.csv", headers: true) do |row|
        invoice_item = InvoiceItems.create(id: row["id"],
                                          item_id: row["item_id"],
                                          invoice_id: row["invoice_id"],
                                          quantity: ["quantity"],
                                          unit_price: ["unit_price"],
                                          created_at: ["created_at"],
                                          updated_at: ["updated_at"])
      puts "#{name}- #{invoice_item.errors.full_messages.join(", ")}" if invoice_item.errors.any?
      counter += 1 if invoice_item.persisted?
      end

      puts "Imported #{counter} invoice items"
  end

  desc "Import invoices from csv"
    task invoices: :environment do
      counter = 0
      CSV.foreach("db/csv/invoices.csv", headers: true) do |row|
        invoice = Invoice.create(id: row["id"],
                                customer_id: row["customer_id"],
                                merchant_id: row["merchant_id"],
                                status: row["status"],
                                created_at: row["created_at"],
                                updated_at: row["updated_at"])
      puts "#{name}- #{invoice.errors.full_messages.join(", ")}" if invoice.errors.any?
      counter += 1 if invoice.persisted?
    end
    end
>>>>>>> 6cdbc98f2a437d2dcd83345aadb06db5a7e1f2aa
end
