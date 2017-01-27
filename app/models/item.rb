class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :unit_price, numericality: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, :through => :invoice_items

  def self.most_revenue(quantity=1)
    Item
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .group("id")
    .joins(invoice_items: [invoice: :transactions])
    .merge(Transaction.success)
    .order("total_revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity=1)
    Item
    .select("items.*, SUM(invoice_items.quantity) AS total_items")
    .group("id")
    .joins(invoice_items: [invoice: :transactions])
    .merge(Transaction.success)
    .order("total_items DESC")
    .limit(quantity)
  end
end
