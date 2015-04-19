class DebitCard < ActiveRecord::Base
  belongs_to :bank_account

  validates_presence_of :number, :expiration_month, :expiration_year
  validates_length_of :number, is: 8
  validates_numericality_of :expiration_month, greater_than: 0, less_than: 13
  validates_numericality_of :expiration_year, greater_than: 2000
end
