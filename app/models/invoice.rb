class Invoice < ApplicationRecord
  validates :status, presence: true
  
  belongs_to :merchant
end
