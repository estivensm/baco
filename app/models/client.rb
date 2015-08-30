class Client < ActiveRecord::Base
  validates_presence_of :full_name
  validates_uniqueness_of :email, allow_blank: true
  has_many :bank_accounts
  has_many :transactions, through: :bank_accounts

  accepts_nested_attributes_for :bank_accounts

  def birth_decorado
    birth_at.strftime("%A, %B %d, %Y %l:%M %p")
  end

  def transactions_graph_series
    depositos = transactions.depositos.sum(:amount).round(2)
    retiros = transactions.retiros.sum(:amount).round(2)
    intereses = transactions.intereses.sum(:amount).round(2)
    diferencia = (depositos+intereses)-retiros

    {depositos: depositos, retiros: retiros, intereses: intereses, diferencia: diferencia}.to_json
  end
end
