class Transaction < ApplicationRecord
validates_presence_of :result, :credit_card_number
end
