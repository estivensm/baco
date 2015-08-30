class Transaction < ActiveRecord::Base
  belongs_to :bank_account
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validate :less_than_balance
  after_destroy :rollback
  after_create :generar

  scope :depositos, -> {where(label: "Deposito")}
  scope :retiros, -> {where(label: "Retiro")}
  scope :intereses, -> {where(label: "Interes")}

  def generar
    case self.label
    when "Deposito"
      self.bank_account.depositar(self.amount)
    when "Retiro"
      self.bank_account.retirar(self.amount)
    end

    self.bank_account.save
  end

  def rollback
    case self.label
    when "Deposito"
      self.bank_account.retirar(self.amount)
    when "Retiro"
      self.bank_account.depositar(self.amount)
    end

    self.bank_account.save
  end

  def amount_decorado
    "Lps #{amount}"
  end

  def creacion_decorada
    created_at.strftime("%A, %B %d, %Y %l:%M %p")
  end

  protected

    def less_than_balance
      if self.amount.present? && self.label == "Retiro" && self.amount > bank_account.balance
        errors[:amount] << "debe ser menor o igual que el saldo"
      end
    end
end
