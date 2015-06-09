class BankAccount < ActiveRecord::Base
  belongs_to :client
  has_one :debit_card
  has_many :transactions

  validates_presence_of :currency
  validates_numericality_of :balance, greater_than_or_equal_to: 0

  def depositar(monto)
    self.balance = self.balance + monto
  end

  def retirar(monto)
    self.balance = self.balance - monto
  end

  def self.generar_intereses
    collection = all
    collection.each do |account|
      account.balance = account.balance + account.balance * 0.05
      account.save
    end
  end
end
