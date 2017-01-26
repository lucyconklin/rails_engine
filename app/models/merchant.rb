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

  def self.most_revenue(quantity = 1)
    joins(:invoices)
    # .merge(Transaction.success)
  end
end
