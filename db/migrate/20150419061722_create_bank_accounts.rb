class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.decimal :balance
      t.string :currency
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
