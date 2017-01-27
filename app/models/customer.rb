class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .joins(invoices: [:transactions])
    .merge(Transaction.success)
    .group("merchants.id")
    .order("count(transactions.id) DESC")
    .first
  end
end
