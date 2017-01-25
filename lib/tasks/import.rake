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
      # puts "#{name}- #{customer.errors.full_messages.join(", ")}" if customer.errors.any?
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
end
