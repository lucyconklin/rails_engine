class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def favorite_customer
    customers.joins(:transactions)
            .merge(Transaction.success)
            .group("customers.id")
            .order("count(transactions.id) DESC")
            .first
  end

  def self.most_revenue(quantity=1)
    Merchant
    .select("merchants.*, (invoice_items.quantity * invoice_items.unit_price) AS sum")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.success)
    .order("sum DESC")
    .limit(quantity)

    # # select("merchants AS sum")
    # joins(invoices: [:transactions, :invoice_items])
    # .merge(Transaction.success)
    # .sum("invoice_items.quantity * invoice_items.unit_price")
    # .order("sum DESC")
    # .limit(quantity)
  end

  def self.most_sold(quantity = 1)
    Merchant
    .select("merchants.*, SUM(invoice_items.quantity) AS sum")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.success)
    .order("sum DESC")
    .limit(quantity)
  end

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
