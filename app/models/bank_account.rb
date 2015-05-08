class BankAccount < ActiveRecord::Base
  belongs_to :client
  has_one :debit_card
  has_many :transactions

  validates_presence_of :currency
  validates_numericality_of :balance, greater_than_equal_to: 0
end
