class Client < ActiveRecord::Base
  validates_presence_of :full_name
  validates_uniqueness_of :email, allow_blank: true
  has_many :bank_accounts

  accepts_nested_attributes_for :bank_accounts

  def birth_decorado
    birth_at.strftime("%A, %B %d, %Y %l:%M %p")
  end
end
