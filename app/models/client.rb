class Client < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :age, greater_than: 0

  has_many :bank_accounts
end
