class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices

  def total_revenue
    invoices.joins(:transactions, :invoice_items)
    .merge(Transaction.success)
    .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def date_total_revenue(date)
    invoices
    .where(created_at: date).joins(:transactions, :invoice_items)
    .merge(Transaction.success)
    .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.total_revenue(date)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.success)
    .where(invoices: {created_at: date})
    .sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
