class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :unit_price, numericality: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, :through => :invoice_items

  def best_day
    invoices
    .joins(:invoice_items)
    .group("invoices.id")
    .order("sum(invoice_items.quantity) DESC")
    .first
    .created_at
  end
end
