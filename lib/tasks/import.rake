require 'csv'

namespace :import do

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
end
