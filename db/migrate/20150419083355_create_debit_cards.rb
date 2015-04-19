class CreateDebitCards < ActiveRecord::Migration
  def change
    create_table :debit_cards do |t|
      t.string :number
      t.integer :expiration_month
      t.integer :expiration_year
      t.references :bank_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
