class Transaction < ApplicationRecord
validates_presence_of :result, :credit_card_number
belongs_to :invoice

  def self.success
    where(result: "success")
  end
end
