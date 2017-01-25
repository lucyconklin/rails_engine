class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :merchant
  has_many :transactions
end
