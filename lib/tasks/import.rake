require 'smarter_csv'

namespace :import do

  desc "Import customers from csv"
  task customers: :environment do
    counter = 0
    CSV.foreach("db/csv/customers.csv", headers: true) do |row|
      customer = Customer.create(id: row["id"],
                                first_name: row["first_name"],
                                last_name: row["last_name"],
                                created_at: row["created_at"],
                                updated_at: row["updated_at"])
      puts "#{name}- #{customer.errors.full_messages.rails s
      join(", ")}" if customer.errors.any?
      counter += 1 if customer.persisted?
    end

    puts "Imported #{counter} customers"

  end
  desc "Import merchants from csv"
  task merchants: :environment do
    counter = 0
    CSV.foreach("db/csv/merchants.csv", headers: true) do |row|
      merchant = Merchant.create(id: row["id"],
                                 name: row["name"],
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
        item = Item.create(id: row["id"],
                          name: row["name"],
                          description: row["description"],
                          unit_price: row["unit_price"],
                          merchant_id: row["merchant_id"],
                          created_at: row["created_at"],
                          updated_at: row["updated_at"])
      puts "#{name}- #{item.errors.full_messages.join(", ")}" if item.errors.any?
      counter += 1 if item.persisted?
    end

    puts "Imported #{counter} items"
  end

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
end
