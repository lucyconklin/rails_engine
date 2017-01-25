class InvoiceItem < ApplicationRecord
  validates :unit_price, presence: true
  validates :quantity, presence: true

  belongs_to :item
  belongs_to :invoice
end
