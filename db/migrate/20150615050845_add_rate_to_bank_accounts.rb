class AddRateToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :rate, :decimal, default: 0
  end
end
